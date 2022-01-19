# Declare cmake information
cmake_minimum_required(VERSION 3.13.4)
project(exec)
set(ASSERT_DIR ${CMAKE_CURRENT_BINARY_DIR}/assert)

# Write a file in ASSERT_DIR
file( TOUCH_NOCREATE ${ASSERT_DIR}/touchfile.txt )
file( WRITE ${ASSERT_DIR}/demo.txt "1234" )
file( APPEND ${ASSERT_DIR}/demo.txt "5678" )

# Read a file from ASSERT_DIR
file( READ ${ASSERT_DIR}/demo.txt file_content)
message("${file_content}")

# Set file list into variable file_list
file(
    GLOB
    file_list
    main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/classes/test_class.cpp
)
message("${file_list}")

# Use Globbing-Expressions to search file into variable classes_list
file(
    GLOB
    classes_list
    "${CMAKE_CURRENT_SOURCE_DIR}/classes/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/classes/*.h"
)
message("${classes_list}")

# Use file to archive, need cmake version 3.18+
#file(ARCHIVE_CREATE
#    OUTPUT classes
#    PATHS ${classes_list}
#    FORMAT zip
#    VERBOSE
#)
