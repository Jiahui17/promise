# Acknowledgement: This example was adapted from here: https://github.com/VCA-EPFL/Feb21_sp2024
add_test(NAME TestDualGCD
  COMMAND
  promise main ${CMAKE_CURRENT_SOURCE_DIR}/hdl/main.v ${CMAKE_CURRENT_SOURCE_DIR}/hdl/FIFO2.v ${CMAKE_CURRENT_SOURCE_DIR}/hdl/mkGCD2.v ${CMAKE_CURRENT_SOURCE_DIR}/hdl/mkGCDGuarded.v
)