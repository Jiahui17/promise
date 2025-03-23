#pragma once
#include "boost/dynamic_bitset.hpp"
#include "kernel/rtlil.h"
#include "promise/Invariants.h"
#include <boost/dynamic_bitset/dynamic_bitset.hpp>
#include <cstddef>
#include <set>
#include <unordered_set>

/// \brief A table-like structure that holds the state mapping between the
/// original state and the encoding state.
struct StateMappingTable {

  using Entry = std::pair</* Original */ boost::dynamic_bitset<>,
                          /* Encoded */ boost::dynamic_bitset<>>;

  /// \brief: the entries of the table. An entry is a pair of "original state"
  /// and "encoded state" (the order matters here). Example:
  /// | Original | Encoded |
  /// | -------- | ------- |
  /// | 0 0 0    | 0 0     |
  /// | 0 0 1    | 0 1     |
  /// | 0 1 0    | 1 0     |
  /// | 1 0 0    | 1 1     |
  /// \note Unspecified entries are all "don't cares".
  ///
  /// \note the LSB of Original is Original[0] and the MSB is
  /// Original[Original.size() - 1]. But when printing it you should reverse
  std::vector<Entry> tblEntries;
  unsigned originalBitWidth = 0;
  unsigned encodedBitWidth = 0;

  void addEntry(const boost::dynamic_bitset<> &ori,
                const boost::dynamic_bitset<> &enc) {

    assert(tblEntries.empty() || tblEntries[0].first.size() == ori.size());
    assert(tblEntries.empty() || tblEntries[0].second.size() == enc.size());

    originalBitWidth = ori.size();
    encodedBitWidth = enc.size();

    tblEntries.emplace_back(ori, enc);
  }

  /// \brief This method returns the set of on-sets of the encoding function. An
  /// encoding function maps the original FF inputs into the inputs of the
  /// encoded FFs.
  ///
  /// \example Consider the example above. Calling tbl.encodingFuncOnSet(0)
  /// returns {0, 1, 0} and {1, 0, 0}.
  std::vector<boost::dynamic_bitset<>> encodingFuncOnSet(size_t pos) const {
    std::vector<boost::dynamic_bitset<>> onSet;
    for (auto [ori, enc] : tblEntries) {
      if (enc[pos]) {
        onSet.push_back(ori);
      }
    }
    return onSet;
  }

  /// \brief This method returns the set of on-sets of the decoding function. An
  /// decoding function maps the decoded FF outputs to the original outputs
  ///
  /// \example Consider the example above. Calling tbl.decodingFuncOnSet(0)
  /// returns {1, 1}.
  std::vector<boost::dynamic_bitset<>> decodingFuncOnSet(size_t pos) const {
    std::vector<boost::dynamic_bitset<>> onSet;
    for (auto [ori, enc] : tblEntries) {
      if (ori[pos]) {
        onSet.push_back(enc);
      }
    }
    return onSet;
  }

  std::optional<boost::dynamic_bitset<>>
  getEncodedState(const boost::dynamic_bitset<> &originalState) const {
    for (auto [ori, enc] : tblEntries) {
      if (ori == originalState)
        return enc;
    }
    return std::nullopt;
  }

  /// \brief A static method that constructs a table for optimizing a set of
  /// mutually exclusive FFs, e.g., f_1 + (!f_2) + f_3 + (!f_4) + ... + f_N <= 1
  ///
  /// \returns A state mapping table that maps the original states of the
  /// mutually exclusive FFs to the states of the FFs after the encoding
  /// optimization.
  ///
  /// \param originalBitWidth: the number of bits in the original state, i.e.,
  /// the number of mutually exclusive FFs.
  ///
  /// \param encodedBitWidth: the number of bits in the encoded state, i.e., the
  /// number of FFs after the encoding optimization.
  static StateMappingTable mappingForMutexFFs(size_t originalBitWidth,
                                              size_t encodedBitWidth) {
    StateMappingTable tbl;
    for (size_t pos = 0;
         pos < /* number of combinations */ originalBitWidth + 1; ++pos) {
      auto originalState = boost::dynamic_bitset<>(originalBitWidth, 1) << pos;
      auto encodedState = boost::dynamic_bitset<>(encodedBitWidth, pos);
      tbl.addEntry(originalState, encodedState);
    }
    return tbl;
  }
};

/// \brief Extracting a set of encoding optimizations from a set of invariants,
/// and apply them to the module. This function assumes that the invariants are
/// already proven by formal verification.
///
/// \param module: the RTLIL module to apply the encoding optimizations to.
///
/// \param invariants: the set of invariants to extract the encoding
/// optimizations from.
void applyEncodingOptimizationUsingInvariants(
    RTLIL::Module *module, const std::vector<LinearInvariant> &invariants);