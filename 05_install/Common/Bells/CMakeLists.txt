add_library(Bells)

target_sources(Bells
    PRIVATE
        Bell.cpp
        Bell.h)

target_include_directories(Bells
    PUBLIC
        .)

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    add_library(${PROJECT_NAME}::Bells ALIAS Bells)
    return()
endif()

install(
    TARGETS Bells)

install(
    FILES Bell.h
    TYPE INCLUDE)
