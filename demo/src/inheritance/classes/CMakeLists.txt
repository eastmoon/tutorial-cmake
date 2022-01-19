# Declare cmake information
cmake_minimum_required(VERSION 3.13.4)

# Setting static library
project(classes)
add_library(
    classes SHARED
    class_public.cpp
    class_interface.cpp
    class_private.cpp
)
# Set header file search directories in target executable
target_include_directories(classes PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/public)
target_include_directories(classes INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/interface)
target_include_directories(classes PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/private)

# Inspect target exec could use include directories
message(">> Show target classes INCLUDE_DIRECTORIES")
get_property(dirs TARGET classes PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
  message(STATUS "dir='${dir}'")
endforeach()

# Inspect target exec dependency target could use include directories
message(">> Show target classes INTERFACE_INCLUDE_DIRECTORIES")
get_property(dirs TARGET classes PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
  message(STATUS "dir='${dir}'")
endforeach()
