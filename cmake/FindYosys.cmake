# Usage:
#   include(cmake/FindYosys.cmake)
#   target_link_libraries(your_target PRIVATE YosysLib)

# Set YOSYS_ROOT to the path where Yosys is built (e.g. ../yosys)
if(NOT DEFINED YOSYS_ROOT)
  message(FATAL_ERROR "Please set YOSYS_ROOT to point to your Yosys source directory")
endif()

# Check if yosys.a exists
find_library(YOSYS_LIB 
  NAMES yosys libyosys 
  PATHS "${YOSYS_ROOT}/install/lib/yosys"
  PATH_SUFFIXES "." "build"
  NO_DEFAULT_PATH
)

if(NOT YOSYS_LIB)
  message(FATAL_ERROR "Could not find libyosys.so in \"${YOSYS_ROOT}\". Make sure you ran 'make' in the Yosys source dir.")
endif()

message(STATUS "Found Yosys dynamic lib: ${YOSYS_LIB}")

# Create interface target
add_library(YosysLib SHARED IMPORTED)

# NOTE: Yosys hard codes the SONAME as $PREFIX/lib/yosys/libyosys.so
# This hardcoded path is picked up by the compile time linker (ld). If this
# location doesn't exist during runtime, the application crashes before it
# searches the LD_LIBRARY_PATH
set_target_properties(YosysLib PROPERTIES
  IMPORTED_LOCATION "${YOSYS_LIB}"
)

