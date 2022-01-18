cmake_minimum_required(VERSION 2.8.10)
project(exec)
file(
    GLOB
    includes_library
    "classes/*.cpp"
    "classes/*.h"
)
add_executable(
    exec
    main.cpp
    ${includes_library}
)
