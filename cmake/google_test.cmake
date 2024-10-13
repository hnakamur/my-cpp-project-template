include(FetchContent)
fetchcontent_declare(
  googletest # Specify the commit you depend on and update it regularly.
             # v1.15.2
  URL https://github.com/google/googletest/archive/b514bdc898e2951020cbdca1304b75f5950d1f59.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt
    ON
    CACHE BOOL "" FORCE
)
fetchcontent_makeavailable(googletest)
