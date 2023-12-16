set(CLANG_FORMAT
    clang-format
    CACHE STRING "Path to clang-format command"
)

function(add_clang_format_target target files)
  find_program(CLANG_FORMAT_PATH ${CLANG_FORMAT} REQUIRED)
  add_custom_command(
    TARGET ${target}
    PRE_BUILD
    COMMAND ${CLANG_FORMAT_PATH} -i ${files}
    COMMENT "Checking clang-format for ${target}"
    VERBATIM
  )
endfunction(add_clang_format_target)
