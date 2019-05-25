include(CMakeFindDependencyMacro)

find_dependency(Common 1.0)

include(${CMAKE_CURRENT_LIST_DIR}/@PROJECT_NAME@Targets.cmake)
