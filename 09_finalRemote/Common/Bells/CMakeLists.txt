add_library(Bells)

target_sources(Bells
    PRIVATE
        Bell.cpp
        Bell.h)

target_include_directories(Bells
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    add_library(${PROJECT_NAME}::Bells ALIAS Bells)
    return()
endif()

install(
    TARGETS Bells
    EXPORT ${PROJECT_NAME}Targets)

install(
    FILES Bell.h
    TYPE INCLUDE)
