include_guard()

macro(run_conan)

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")

    file(
        DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
        "${CMAKE_BINARY_DIR}/conan.cmake"
    )
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_add_remote(
    NAME conancenter
    URL https://center.conan.io
)

conan_cmake_run(
    CONANFILE "conanfile.txt"
    CMAKE_TARGETS
    BUILD missing
)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)

set(CONAN_SYSTEM_INCLUDES ON)

conan_basic_setup(NO_OUTPUT_DIRS)

endmacro()
