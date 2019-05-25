cmake_minimum_required(VERSION 3.14)
project(Common VERSION 1.0 LANGUAGES CXX)

set(MY_PROJECT_CMAKE_FILE "${PROJECT_BINARY_DIR}/MyProject.cmake")
if(NOT EXISTS "${MY_PROJECT_CMAKE_FILE}")
    file(DOWNLOAD "https://raw.githubusercontent.com/mikedld/corehard2019-cmake/master/09_finalRemote/CMakeCommon/MyProject.cmake"
                  "${MY_PROJECT_CMAKE_FILE}")
endif()
include("${MY_PROJECT_CMAKE_FILE}")

my_project_init()

add_subdirectory(Bells)
add_subdirectory(Whistles)
