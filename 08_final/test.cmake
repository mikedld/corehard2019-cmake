cmake_minimum_required(VERSION 3.14)

macro(_pack PROJ)
    file(MAKE_DIRECTORY "${D}/${PROJ}.Package")
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}/${PROJ}"
                           "-DCMAKE_INSTALL_PREFIX=${D}/${PROJ}.Prefix" ${ARGN}
                   WORKING_DIRECTORY "${D}/${PROJ}.Package")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}/${PROJ}.Package")
endmacro()

macro(test_final_bothPrivate)
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}"
                           -DCommon_USE_PRIVATE=ON
                           -DGitHubApi_USE_PRIVATE=ON
                           "-DCMAKE_INSTALL_PREFIX=${D}/MonsterBot.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

macro(test_final_commonPacked_gitHubApiPrivate)
    _pack(Common)
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}"
                           "-DCMAKE_PREFIX_PATH=${D}/Common.Prefix"
                           -DGitHubApi_USE_PRIVATE=ON
                           "-DCMAKE_INSTALL_PREFIX=${D}/MonsterBot.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

macro(test_final_commonPrivate_gitHubApiPacked)
    _pack(Common)
    _pack(GitHubApi "-DCMAKE_PREFIX_PATH=${D}/Common.Prefix")
    file(REMOVE_RECURSE "${D}/Common.Package" "${D}/Common.Prefix")
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}"
                           "-DCMAKE_PREFIX_PATH=${D}/GitHubApi.Prefix"
                           -DCommon_USE_PRIVATE=ON
                           "-DCMAKE_INSTALL_PREFIX=${D}/MonsterBot.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

macro(test_final_bothPacked)
    _pack(Common)
    _pack(GitHubApi "-DCMAKE_PREFIX_PATH=${D}/Common.Prefix")
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}"
                           "-DCMAKE_PREFIX_PATH=${D}/Common.Prefix\\;${D}/GitHubApi.Prefix"
                           "-DCMAKE_INSTALL_PREFIX=${D}/MonsterBot.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

include("${CMAKE_CURRENT_LIST_DIR}/../test_driver.cmake")
