cmake_minimum_required(VERSION 3.14)

get_filename_component(S "${CMAKE_PARENT_LIST_FILE}" DIRECTORY)
get_filename_component(TEST "${S}" NAME)

function(color_message)
    execute_process(COMMAND
        "${CMAKE_COMMAND}" -E env CLICOLOR_FORCE=1
        "${CMAKE_COMMAND}" -E cmake_echo_color ${ARGN})
endfunction()

color_message(--green --bold "-- ==> ${TEST}")

function(ASSERT_PROCESS)
    list(JOIN ARGN " " CMDLINE)
    color_message(--yellow "-- ~~> ${CMDLINE}")

    execute_process(${ARGN} RESULT_VARIABLE ERR_CODE)
    if(NOT ERR_CODE EQUAL 0)
        message(FATAL_ERROR "Command finished with code ${ERR_CODE}")
    endif()
endfunction()

get_property(TEST_CASES DIRECTORY PROPERTY MACROS)
list(FILTER TEST_CASES INCLUDE REGEX "^[Tt][Ee][Ss][Tt]_")

foreach(TC IN LISTS TEST_CASES)
    color_message(--blue --bold "-- --> ${TC}")

    set(D "${S}/.test/${TC}")
    file(REMOVE_RECURSE "${D}")
    file(MAKE_DIRECTORY "${D}")

    set(TC_FILE "${D}/test_invoker.cmake")
    file(WRITE "${TC_FILE}" "${TC}()")
    include("${TC_FILE}/")
endforeach()
