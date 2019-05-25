cmake_minimum_required(VERSION 3.14)
project(GitHubApi VERSION 1.0 LANGUAGES CXX)

set(MY_PROJECT_CMAKE_FILE "${PROJECT_BINARY_DIR}/MyProject.cmake")
if(NOT EXISTS "${MY_PROJECT_CMAKE_FILE}")
    file(DOWNLOAD "https://raw.githubusercontent.com/mikedld/corehard2019-cmake/master/09_finalRemote/CMakeCommon/MyProject.cmake"
                  "${MY_PROJECT_CMAKE_FILE}")
endif()
include("${MY_PROJECT_CMAKE_FILE}")

my_project_init()

find_package(Common 1.0 REQUIRED)

add_library(GitHubApi)

target_sources(GitHubApi
    PRIVATE
        GitHubApi.cpp
        GitHubApi.h)

target_include_directories(GitHubApi
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

target_link_libraries(GitHubApi
    PRIVATE
        Common::Bells)

if(MY_IS_SUBPROJECT)
    add_library(${PROJECT_NAME}::GitHubApi ALIAS GitHubApi)
    return()
endif()

install(
    TARGETS GitHubApi
    EXPORT ${PROJECT_NAME}Targets)

install(
    FILES GitHubApi.h
    TYPE INCLUDE)
