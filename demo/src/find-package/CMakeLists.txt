# Declare cmake information
# Output executable file in CMAKE_RUNTIME_OUTPUT_DIRECTORY
# Output static library file (.a) in CMAKE_ARCHIVE_OUTPUT_DIRECTORY
# Output dynamic library file (.so) in CMAKE_LIBRARY_OUTPUT_DIRECTORY
cmake_minimum_required(VERSION 3.13.4)
project(exec VERSION 1.2.3.0)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Search package Boost
# Boost_LIBRARIES will empty, because Boost is package name, not component name
find_package(Boost)
if ( Boost_FOUND )
    message("${Boost_VERSION}")
    message("${Boost_INCLUDE_DIRS}")
    message("${Boost_LIBRARY_DIRS}")
    message("${Boost_LIBRARIES}")
endif()

# Search a component system in package Boost
# Boost_LIBRARIES have value libboost_system.so
find_package(Boost REQUIRED
  COMPONENTS
    system
)
if ( Boost_FOUND )
    message("${Boost_VERSION}")
    message("${Boost_INCLUDE_DIRS}")
    message("${Boost_LIBRARY_DIRS}")
    message("${Boost_LIBRARIES}")
endif()
