# Declare cmake information
cmake_minimum_required(VERSION 3.13.4)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Setting include file global search directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/global)

# Setting executable target exec1 and assign target search directories
project(exec1)
add_executable(
    exec1
    main.cpp
)
target_include_directories(exec1 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/target1)

# Setting executable target exec2 and assign target search directories
project(exec2)
add_executable(
    exec2
    main.cpp
)
target_include_directories(exec2 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/target2)
