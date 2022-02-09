cmake_minimum_required(VERSION 2.8.10)
project(exec)
add_executable(
    exec
    main.cpp
)
target_include_directories(exec PUBLIC /usr/local/include)
