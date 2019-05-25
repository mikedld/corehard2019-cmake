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
        Bells)
