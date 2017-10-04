#cmake_minimum_required(VERSION 3.7.1)
cmake_minimum_required(VERSION 3.0.0)

project(hello-world)

#set(SOURCE_FILE main.c)
set(SRC_LIST main.c)

message(STATUS "This is BINARY dir " ${PROJECT_BINARY_DIR})
message(STATUS "This is SOURCE dir " ${PROJECT_SOURCE_DIR})
#message(STATUS "This is SOURCE FILE " ${SOURCE_FILE})
message(STATUS "This is SOURCE FILE " ${SRC_LIST})
message(STATUS "This is EXECUTABLE_OUTPUT_PATH " ${EXECUTABLE_OUTPUT_PATH})

#add_executable(hello-world ${SOURCE_FILE})
add_executable(hello-world ${SRC_LIST})
