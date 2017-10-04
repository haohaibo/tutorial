CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(main)

option( BUILD_EXAMPLES "Build amdphdrs examples in addition to the tool [requires clang, hsa]" ON )
message(STATUS "hhb BUILD_EXAMPLES ${BUILD_EXAMPLES}")

ADD_SUBDIRECTORY(src)
AUX_SOURCE_DIRECTORY(. DIR_SRCS)

ADD_EXECUTABLE(main ${DIR_SRCS})
TARGET_LINK_LIBRARIES(main Test)

