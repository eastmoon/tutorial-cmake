# Declare cmake information
# Output executable file in CMAKE_RUNTIME_OUTPUT_DIRECTORY
# Output static library file (.a) in CMAKE_ARCHIVE_OUTPUT_DIRECTORY
# Output dynamic library file (.so) in CMAKE_LIBRARY_OUTPUT_DIRECTORY
cmake_minimum_required(VERSION 3.13.4)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Set header file search directories in global
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Add new CMakeList job in target sub-directory
# It will create a "classes" library
add_subdirectory(classes)

# Setting executable target exec1
project(exec1)
add_executable(
    exec1
    main_public.cpp
)
target_link_libraries(exec1 classes)

# Setting executable target exec2
project(exec2)
add_executable(
    exec2
    main_interface.cpp
)
target_link_libraries(exec2 classes)

# Setting executable target exec3
project(exec3)
add_executable(
    exec3
    main_private.cpp
)
target_link_libraries(exec3 classes)
