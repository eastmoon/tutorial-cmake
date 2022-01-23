# Declare cmake information
# Output executable file in CMAKE_RUNTIME_OUTPUT_DIRECTORY
# Output static library file (.a) in CMAKE_ARCHIVE_OUTPUT_DIRECTORY
# Output dynamic library file (.so) in CMAKE_LIBRARY_OUTPUT_DIRECTORY
cmake_minimum_required(VERSION 3.13.4)
project(exec VERSION 1.2.3.0)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Add new CMakeList job in target sub-directory
# It will create a "classes" library
add_subdirectory(libs)

# Set soruce_dir is header file search directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Setting executable target
add_executable(
    exec
    main.cpp
)
target_link_libraries(exec libs)
