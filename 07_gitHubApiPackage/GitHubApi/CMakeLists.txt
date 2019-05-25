cmake_minimum_required(VERSION 3.14)
project(GitHubApi VERSION 1.0 LANGUAGES CXX)

include(GNUInstallDirs)

find_package(Common REQUIRED)

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

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    add_library(${PROJECT_NAME}::GitHubApi ALIAS GitHubApi)
    file(WRITE "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake" "")
    set(${PROJECT_NAME}_DIR "${PROJECT_BINARY_DIR}" CACHE PATH
        "The directory containing a CMake configuration file for ${PROJECT_NAME}.")
    return()
endif()

install(
    TARGETS GitHubApi
    EXPORT ${PROJECT_NAME}Targets)

install(
    FILES GitHubApi.h
    TYPE INCLUDE)

configure_file(
    Config.cmake
    ${PROJECT_NAME}Config.cmake
    @ONLY)

install(
    EXPORT ${PROJECT_NAME}Targets
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
    NAMESPACE ${PROJECT_NAME}::)

install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
