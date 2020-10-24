#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "myMathLib::add" for configuration ""
set_property(TARGET myMathLib::add APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(myMathLib::add PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libadd.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS myMathLib::add )
list(APPEND _IMPORT_CHECK_FILES_FOR_myMathLib::add "${_IMPORT_PREFIX}/lib/libadd.a" )

# Import target "myMathLib::myMath" for configuration ""
set_property(TARGET myMathLib::myMath APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(myMathLib::myMath PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libmyMath.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS myMathLib::myMath )
list(APPEND _IMPORT_CHECK_FILES_FOR_myMathLib::myMath "${_IMPORT_PREFIX}/lib/libmyMath.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
