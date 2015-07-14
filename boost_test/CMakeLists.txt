cmake_minimum_required (VERSION 2.6)
project (boost_test)

include_directories(${BOOST_INCLUDE_DIR})


add_executable(boost_test src/main.cpp)
