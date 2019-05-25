add_library(Whistles)

target_sources(Whistles
    PRIVATE
        Whistle.cpp
        Whistle.h)

target_include_directories(Whistles
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    add_library(${PROJECT_NAME}::Whistles ALIAS Whistles)
    return()
endif()

install(
    TARGETS Whistles
    EXPORT ${PROJECT_NAME}Targets)

install(
    FILES Whistle.h
    TYPE INCLUDE)
