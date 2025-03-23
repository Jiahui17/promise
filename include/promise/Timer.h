#pragma once
#include "promise/StringUtils.h"
#include <chrono>
#include <iostream>

using namespace std::chrono;

/// \brief A utility class to measure the elapsed time of a code block.
///
/// \example
///   #include "promise/Timer.h"
///   ...
///   {
///     Timer time("pdr");
///   }
///   When the time is out of scope, it prints
///   Elapsed time: 2000 ms
class Timer {
public:
  Timer(const std::string &name)
      : start(high_resolution_clock::now()), name(name) {}

  ~Timer() {
#define LOG_SIMULATION_TIME
#ifdef LOG_SIMULATION_TIME
    auto end = high_resolution_clock::now();
    duration<double, std::milli> elapsed = end - start;
    std::cerr << "[TIMER] [" << name << "] " << elapsed.count() << " ms\n";
#endif // LOG_SIMULATION_TIME
  }

  // In case we want to change the info before leaving
  void setName(const std::string &newName) { name = newName; }

private:
  high_resolution_clock::time_point start;
  std::string name;
};