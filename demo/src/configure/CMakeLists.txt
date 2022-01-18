# Declare cmake information
cmake_minimum_required(VERSION 3.13.4)
project(exec VERSION 1.2.3.0)
set(CMAKE_INCLUDE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/includes)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Copy and Configure file
configure_file(def.h.in ${CMAKE_INCLUDE_OUTPUT_DIRECTORY}/def.h @ONLY)

# Setting include file search directories
include_directories(${CMAKE_INCLUDE_OUTPUT_DIRECTORY})

# Setting executable target
add_executable(
    exec
    main.cpp
)
