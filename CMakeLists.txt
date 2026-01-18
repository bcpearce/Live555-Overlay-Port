cmake_minimum_required(VERSION 3.30)

set(CMAKE_CXX_STANDARD 23)

add_compile_definitions($<$<CONFIG:Debug>:_DEBUG>)

project(Live555OverlayPort)

find_package(Live555 CONFIG REQUIRED)

add_executable(Dummy main.cpp)
target_link_libraries(
  Dummy PUBLIC Live555::groupsock Live555::liveMedia Live555::UsageEnvironment
               Live555::BasicUsageEnvironment)
