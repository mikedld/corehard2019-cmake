add_executable(MonsterBot)

target_sources(MonsterBot
    PRIVATE
        MonsterBot.cpp)

target_link_libraries(MonsterBot
    PRIVATE
        GitHubApi::GitHubApi)

install(
    TARGETS MonsterBot)
