add_test(NAME Iccad25Factorial
  COMMAND
  iccad25-promise-techniques main ${CMAKE_CURRENT_SOURCE_DIR}/hdl/main.v,${CMAKE_CURRENT_SOURCE_DIR}/hdl/factorial.v
)


