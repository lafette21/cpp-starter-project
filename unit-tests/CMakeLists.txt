set(EXEC_NAME test-example)

add_executable(${EXEC_NAME}
    sample.cc
)

target_link_libraries(${EXEC_NAME} PRIVATE
    gtest_main
    gtest
)

code_analysis(${EXEC_NAME} PRIVATE)

add_test(${EXEC_NAME} ${EXEC_NAME})
