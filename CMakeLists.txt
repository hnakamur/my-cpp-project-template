cmake_minimum_required(VERSION 3.20..3.27)
project(MyProject VERSION 0.0.0)

set(CMAKE_CXX_STANDARD
    20
    CACHE STRING "The C++ standard to compile with (default 20)"
)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(hardening)
add_compile_options(-flto -Wunused-parameter)
add_link_options(-flto)

enable_testing()
add_subdirectory(src)
add_subdirectory(tests)

include(cmake_format)
add_cmake_format_target(cmake_format_toplevel)
add_cmake_format_target_recurse(cmake_format_cmake_dir ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
add_cmake_format_target_recurse(cmake_format_src_dir ${CMAKE_CURRENT_SOURCE_DIR}/src)
add_cmake_format_target_recurse(cmake_format_tests_dir ${CMAKE_CURRENT_SOURCE_DIR}/tests)
