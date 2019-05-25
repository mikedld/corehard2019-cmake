cmake_minimum_required(VERSION 3.14)

macro(test_subprojects)
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}"
                           "-DCMAKE_INSTALL_PREFIX=${D}/MonsterBot.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

include("${CMAKE_CURRENT_LIST_DIR}/../test_driver.cmake")
