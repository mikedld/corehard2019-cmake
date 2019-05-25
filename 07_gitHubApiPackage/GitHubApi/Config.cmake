include(CMakeFindDependencyMacro)

find_dependency(Common)

include(${CMAKE_CURRENT_LIST_DIR}/@PROJECT_NAME@Targets.cmake)
