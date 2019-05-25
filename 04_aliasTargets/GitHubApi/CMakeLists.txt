cmake_minimum_required(VERSION 3.14)
project(GitHubApi LANGUAGES CXX)

add_library(GitHubApi)

target_sources(GitHubApi
    PRIVATE
        GitHubApi.cpp
        GitHubApi.h)

target_include_directories(GitHubApi
    PUBLIC
        .)

target_link_libraries(GitHubApi
    PRIVATE
        Common::Bells)

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    add_library(${PROJECT_NAME}::GitHubApi ALIAS GitHubApi)
endif()
