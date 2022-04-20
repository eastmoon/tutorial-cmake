cmake_minimum_required(VERSION 2.8.10)
project(example)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
include_directories("/usr/local/include")
add_executable(
    example
    main.cpp
)
