add_library(GitHubApi)

target_sources(GitHubApi
    PRIVATE
        GitHubApi.cpp
        GitHubApi.h)

target_include_directories(GitHubApi
    PUBLIC
        .)

target_link_libraries(GitHubApi
    PRIVATE
        Bells)
