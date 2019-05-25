add_library(Whistles)

target_sources(Whistles
    PRIVATE
        Whistle.cpp
        Whistle.h)

target_include_directories(Whistles
    PUBLIC
        .)
