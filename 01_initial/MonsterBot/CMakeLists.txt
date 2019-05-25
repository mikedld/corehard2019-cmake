add_executable(MonsterBot)

target_sources(MonsterBot
    PRIVATE
        MonsterBot.cpp)

target_link_libraries(MonsterBot
    PRIVATE
        GitHubApi)

install(
    TARGETS MonsterBot)
