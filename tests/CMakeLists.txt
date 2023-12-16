include(FetchContent)
fetchcontent_declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG main
)
set(gtest_force_shared_crt
    ON
    CACHE BOOL "" FORCE
)
fetchcontent_makeavailable(googletest)

add_executable(sample1_unittest sample1_unittest.cc)
target_link_libraries(sample1_unittest PRIVATE sample1 GTest::gtest_main)
include(GoogleTest)
gtest_discover_tests(sample1_unittest)
