cmake_minimum_required(VERSION 3.5)
project(ExampleProject)

set(SOURCES "main.cpp")
set(CMAKE_CXX_FLAGS "-g")

add_executable(ExampleProject ${SOURCES})