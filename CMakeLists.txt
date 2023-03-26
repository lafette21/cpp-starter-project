cmake_minimum_required(VERSION 3.16...3.23)

# Set the project name and language
project(myproject
    VERSION 0.0.1
    DESCRIPTION ""
    HOMEPAGE_URL "%%myurl%%"
    LANGUAGES CXX C
)

# Include cmake files
include(cmake/compilerWarnings.cmake)
include(cmake/conanConfig.cmake)
include(cmake/settings.cmake)

# Setup Conan
run_conan()

# Set project warnings
add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings)

# Add the src directory
add_subdirectory(src)

# Enable testing
enable_testing()
