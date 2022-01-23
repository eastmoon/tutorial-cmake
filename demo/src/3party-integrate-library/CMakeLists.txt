# Declare cmake information
# Output executable file in CMAKE_RUNTIME_OUTPUT_DIRECTORY
# Output static library file (.a) in CMAKE_ARCHIVE_OUTPUT_DIRECTORY
# Output dynamic library file (.so) in CMAKE_LIBRARY_OUTPUT_DIRECTORY
cmake_minimum_required(VERSION 3.13.4)
project(exec VERSION 1.2.3.0)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Setting executable target
add_executable(
    exec
    main.cpp
)
# Copy library to library_output_directory
find_package(Boost REQUIRED COMPONENTS thread system )
if ( Boost_FOUND )
    foreach(lib ${Boost_LIBRARIES})
        if(EXISTS "${lib}")
            message("Copy ${lib} to ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
            file(GLOB libs "${lib}*")
            file(COPY ${libs} DESTINATION ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
            target_link_libraries(exec PRIVATE ${lib})
        endif()
    endforeach()
endif()
