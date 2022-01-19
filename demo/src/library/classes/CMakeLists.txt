# Declare cmake information
cmake_minimum_required(VERSION 3.13.4)

# Setting static library
project(classes)
add_library(
    classes STATIC
    test_class.cpp
)

project(classes_so)
add_library(
    classes_so SHARED
    test_class_so.cpp
)
