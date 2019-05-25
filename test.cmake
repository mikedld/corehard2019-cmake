cmake_minimum_required(VERSION 3.14)

if(NOT TESTS)
    file(GLOB TESTS
        RELATIVE "${CMAKE_CURRENT_LIST_DIR}"
        "${CMAKE_CURRENT_LIST_DIR}/[0-9][0-9]_*")
endif()

list(SORT TESTS)

foreach(T IN LISTS TESTS)
    set(T_FILE "${CMAKE_CURRENT_LIST_DIR}/${T}/test.cmake")
    if(NOT EXISTS "${T_FILE}")
        continue()
    endif()

    execute_process(COMMAND "${CMAKE_COMMAND}" -P "${T_FILE}" RESULT_VARIABLE ERR_CODE)
    if(NOT ERR_CODE EQUAL 0)
        message(FATAL_ERROR "Command finished with non-zero (${ERR_CODE}): ${ARGN}")
    endif()
endforeach()
