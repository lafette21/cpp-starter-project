cmake_minimum_required(VERSION 3.16...3.23)

# Not ideal to use this global variable, but necessary to make sure
# that tooling and projects use the same version
set(CMAKE_CXX_STANDARD 20)

# Strongly encouraged to enable this globally to avoid conflicts between
# -Wpedantic being enabled and -std=c++20 and -std=gnu++20 for example
# when compiling with PCH enabled
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_BUILD_TYPE Release)

# Set the project name and language
project(myproject
    VERSION 0.0.1
    DESCRIPTION ""
    HOMEPAGE_URL "%%myurl%%"
    LANGUAGES CXX C
)

# Include cmake files
include(cmake/settings.cmake)
include(cmake/compilerWarnings.cmake)
include(cmake/conanConfig.cmake)

run_conan()

find_package(fmt REQUIRED)

# Enable project warnings
add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings TRUE)

# Add the src directory
add_subdirectory(src)

# Enable testing
enable_testing()
