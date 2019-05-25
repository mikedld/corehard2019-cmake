cmake_minimum_required(VERSION 3.14)
project(Common LANGUAGES CXX)

include(GNUInstallDirs)

add_subdirectory(Bells)
add_subdirectory(Whistles)

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    return()
endif()

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
        "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
