cmake_minimum_required(VERSION 2.8.4)

add_executable(curltest main.c)

#include_directories(/usr/local/include)
#target_link_libraries(curltest curl)

include_directories(/usr/include)

find_library(CURL_LIB NAME curl PATHS "/usr/lib")

message(STATUS "Library path CURL_LIB is " ${CURL_LIB})

#target_link_libraries(curltest curl)
target_link_libraries(curltest ${CURL_LIB})

#find_package(Perl)
#find_package(curl)

#if(CURL_FOUND)
#  include_directories(${CURL_INCLUDE_DIR})
#  target_link_libraries(curltest ${CURL_LIBRARY})
#else(CURL_FOUND)
#  message(FATAL_ERROR "CURL library not found")
#endif(CURL_FOUND)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
