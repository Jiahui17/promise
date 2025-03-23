#include "kernel/rtlil.h"
#include "kernel/yosys_common.h"

USING_YOSYS_NAMESPACE

// This returns the "Cell *" that has an output that drives the Wire * w
// [Quirk in Yosys]: Somehow in a cloned design, the "driverCell_" is not
// preserved, so we cannot directly use wire->driverCell().
inline RTLIL::Cell *getDriverCell(Module *module, RTLIL::Wire *wire) {
  for (auto *cell : module->cells()) {
    for (auto [portIdentifier, sigSpec] : cell->connections()) {
      // NOTE: as_wire() does not check if SigSpec was actually from a wire!
      if (cell->output(portIdentifier) && (sigSpec.is_wire()) &&
          (sigSpec.as_wire() == wire)) {
        return cell;
      }
    }
  }
  return nullptr;
}

// This function returns a vector of the given module sorted according to the
// port ID.
// NOTE: the RTLIL::Module::sort() function only sorts the set of cells accoding
// to the IdString, but it will not sort the module in ascending order.
inline std::vector<Wire *> getSortedInput(Module *module) {
  // Make sure that all the ports have their ID assigned.
  module->fixup_ports();
  std::vector<Wire *> inputs;
  for (auto *wire : module->wires()) {
    if (wire->port_input) {
      inputs.push_back(wire);
    }
  }
  std::sort(inputs.begin(), inputs.end(),
            [](Wire *a, Wire *b) { return a->port_id < b->port_id; });
  return inputs;
}