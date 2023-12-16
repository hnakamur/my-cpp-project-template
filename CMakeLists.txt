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

include(clang_format)
set(CLANG_FORMART_TARGET_DIRECTORIES src;tests)
set(CLANG_FORMART_TARGET_PATTERNS *.h;*.cc)
add_clang_format_target()
