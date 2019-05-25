cmake_minimum_required(VERSION 3.14)
project(Common VERSION 1.0 LANGUAGES CXX)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

add_subdirectory(Bells)
add_subdirectory(Whistles)

write_basic_package_version_file(
    "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion)

if(NOT CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    file(WRITE "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake" "")
    set(${PROJECT_NAME}_DIR "${PROJECT_BINARY_DIR}" CACHE PATH
        "The directory containing a CMake configuration file for ${PROJECT_NAME}.")
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
        "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
