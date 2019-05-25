cmake_minimum_required(VERSION 3.14)

macro(_pack PROJ)
    file(MAKE_DIRECTORY "${D}/${PROJ}.Package")
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}/${PROJ}"
                           "-DCMAKE_INSTALL_PREFIX=${D}/${PROJ}.Prefix" ${ARGN}
                   WORKING_DIRECTORY "${D}/${PROJ}.Package")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}/${PROJ}.Package")
endmacro()

macro(test_githubApiPackage_commonBuild)
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}/Common"
                           "-DCMAKE_INSTALL_PREFIX=${D}/Common.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

macro(test_githubApiPackage_gitHubApiBuild)
    _pack(Common)
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}/GitHubApi"
                           "-DCMAKE_PREFIX_PATH=${D}/Common.Prefix"
                           "-DCMAKE_INSTALL_PREFIX=${D}/GitHubApi.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

macro(test_gitHubApiPackage_wholeBuild)
    assert_process(COMMAND "${CMAKE_COMMAND}" "${S}"
                           "-DCMAKE_INSTALL_PREFIX=${D}/MonsterBot.Prefix"
                   WORKING_DIRECTORY "${D}")
    assert_process(COMMAND "${CMAKE_COMMAND}" --build . --target install
                   WORKING_DIRECTORY "${D}")
endmacro()

include("${CMAKE_CURRENT_LIST_DIR}/../test_driver.cmake")
