include_guard()

macro(run_conan)
# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                  "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_add_remote(NAME cci
    URL https://center.conan.io
    INDEX 0
)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

if(CONAN_EXPORTED)
    if(EXISTS "${CMAKE_BINARY_DIR}/../conanbuildinfo.cmake")
        include(${CMAKE_BINARY_DIR}/../conanbuildinfo.cmake)
    else()
        message(FATAL_ERROR "Could not set up conan because \"${CMAKE_BINARY_DIR}/../conanbuildinfo.cmake\" does not exist")
    endif()

    conan_basic_setup()
else()
    conan_cmake_autodetect(settings BUILD_TYPE ${CMAKE_BUILD_TYPE})
    set(CONAN_SETTINGS SETTINGS ${settings})
    set(CONAN_ENV ENV "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}")

    conan_cmake_install(PATH_OR_REFERENCE ${CMAKE_SOURCE_DIR}
        BUILD missing
        CONFIG ${CONAN_ENV} ${CONAN_SETTINGS}
    )
endif()

endmacro()
