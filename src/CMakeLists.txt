
PROJECT_TARGET_ADD(pcscd-glue)

	# compile any C file starting with a lower case
	file(GLOB CSOURCES pcsc-*.c)
	file(GLOB CLIENT_SRC client-*.c)
	file(GLOB HEADERS_SRC *.h)

	# Define project Targets
    add_library(${TARGET_NAME} SHARED ${CSOURCES})

    # define extra dependencies
    pkg_check_modules (PCSC REQUIRED IMPORTED_TARGET libpcsclite)
	target_link_libraries(${TARGET_NAME} PUBLIC PkgConfig::PCSC pthread)

	# lib properties
	SET_TARGET_PROPERTIES(${TARGET_NAME} PROPERTIES
	OUTPUT_NAME ${TARGET_NAME}
	)

    # compilation include path
	target_include_directories(${TARGET_NAME}
	    INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
    )

PROJECT_TARGET_ADD(pcscd-client)
    add_executable(${TARGET_NAME} ${CLIENT_SRC})
    add_dependencies(${TARGET_NAME} pcscd-glue)
  	target_link_libraries(${TARGET_NAME} PUBLIC PkgConfig::PCSC libafb.so json-c pthread pcscd-glue)

    SET_TARGET_PROPERTIES(${TARGET_NAME} PROPERTIES
	LABELS "EXECUTABLE"
	OUTPUT_NAME ${TARGET_NAME}
    )

INSTALL (TARGETS pcscd-glue
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    )

INSTALL (TARGETS pcscd-client
    RUNTIME DESTINATION bin
    )

INSTALL (FILES ${HEADERS_SRC} DESTINATION include)
