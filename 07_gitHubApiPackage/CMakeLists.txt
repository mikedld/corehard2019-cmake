cmake_minimum_required(VERSION 3.14)
project(MonsterBot LANGUAGES CXX)

add_subdirectory(Common)
add_subdirectory(GitHubApi)

find_package(GitHubApi REQUIRED)

add_subdirectory(MonsterBot)
