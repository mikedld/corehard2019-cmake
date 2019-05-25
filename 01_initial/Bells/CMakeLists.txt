add_library(Bells)

target_sources(Bells
    PRIVATE
        Bell.cpp
        Bell.h)

target_include_directories(Bells
    PUBLIC
        .)
