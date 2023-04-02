set(EXEC_NAME example)

add_executable(${EXEC_NAME}
    main.cc
)

target_link_libraries(${EXEC_NAME} PUBLIC
    ${CONAN_LIBS}
)

code_analysis(${EXEC_NAME} PRIVATE)
