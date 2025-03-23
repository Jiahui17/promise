#pragma once
#include <sstream>
#include <string>
#include <vector>

// Helper: trim whitespace
inline std::string trim(const std::string &s) {
  size_t start = s.find_first_not_of(" \t\n\r");
  size_t end = s.find_last_not_of(" \t\n\r");
  return (start == std::string::npos) ? "" : s.substr(start, end - start + 1);
}

// Helper: split string by a delimiter
inline std::vector<std::string> split(const std::string &s, char delimiter) {
  std::vector<std::string> tokens;
  std::stringstream ss(s);
  std::string tok;
  while (getline(ss, tok, delimiter)) {
    tokens.push_back(trim(tok));
  }
  return tokens;
}

inline std::string join(const std::vector<std::string> &elements,
                        const std::string &delimiter) {
  std::ostringstream os;
  for (size_t i = 0; i < elements.size(); ++i) {
    os << elements[i];
    if (i + 1 != elements.size())
      os << delimiter;
  }
  return os.str();
}