cmake_minimum_required(VERSION 3.14)
project(MonsterBot LANGUAGES CXX)

if(Common_USE_PRIVATE)
    add_subdirectory(Common)
endif()

if(GitHubApi_USE_PRIVATE)
    add_subdirectory(GitHubApi)
endif()

find_package(GitHubApi 1.0 REQUIRED)

add_subdirectory(MonsterBot)
