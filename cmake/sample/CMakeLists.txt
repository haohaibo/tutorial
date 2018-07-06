cmake_minimum_required(VERSION 3.0)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS "${CMAKE_BUILD_TYPE} -std=c++11")

project(sample)

add_executable(
    sample_test
    main.cpp
    )
