#
# cgame
#
add_library(cgame${LIB_SUFFIX}${ARCH} MODULE ${CGAME_SRC})
set_target_properties(cgame${LIB_SUFFIX}${ARCH}
	PROPERTIES COMPILE_DEFINITIONS "CGAMEDLL"
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "legacy"
	LIBRARY_OUTPUT_DIRECTORY_DEBUG "legacy"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE "legacy"
	#OSX_ARCHITECTURES "i386;x86_64"
)

#
# qagame
#
add_library(qagame${LIB_SUFFIX}${ARCH} MODULE ${QAGAME_SRC})
if(FEATURE_LUA)
	if(BUNDLED_LUA)
		add_dependencies(qagame${LIB_SUFFIX}${ARCH} bundled_lua)
	endif(BUNDLED_LUA)
	target_link_libraries(qagame${LIB_SUFFIX}${ARCH} ${MOD_LIBRARIES})
endif(FEATURE_LUA)

if(FEATURE_SERVERMDX)
	set(QAGAME_DEFINES "GAMEDLL;FEATURE_SERVERMDX")
else()
	set(QAGAME_DEFINES "GAMEDLL")
endif()

set_target_properties(qagame${LIB_SUFFIX}${ARCH}
	PROPERTIES COMPILE_DEFINITIONS "${QAGAME_DEFINES}"
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "legacy"
	LIBRARY_OUTPUT_DIRECTORY_DEBUG "legacy"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE "legacy"
)

#
# ui
#
add_library(ui${LIB_SUFFIX}${ARCH} MODULE ${UI_SRC} ${LUA_FILES})
if(FEATURE_LUA)
	if(BUNDLED_LUA)
		add_dependencies(ui${LIB_SUFFIX}${ARCH} bundled_lua)
	endif(BUNDLED_LUA)
	target_link_libraries(ui${LIB_SUFFIX}${ARCH} ${MOD_LIBRARIES})
endif(FEATURE_LUA)
set_target_properties(ui${LIB_SUFFIX}${ARCH}
	PROPERTIES
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "legacy"
	LIBRARY_OUTPUT_DIRECTORY_DEBUG "legacy"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE "legacy"
	#OSX_ARCHITECTURES "i386;x86_64"
)

# install bins of cgame, ui and qgame
if(BUILD_MOD_PK3)
	install(TARGETS qagame${LIB_SUFFIX}${ARCH}
		LIBRARY DESTINATION "${INSTALL_DEFAULT_MODDIR}/legacy"
		ARCHIVE DESTINATION "${INSTALL_DEFAULT_MODDIR}/legacy"
	)
else()
	install(TARGETS cgame${LIB_SUFFIX}${ARCH} qagame${LIB_SUFFIX}${ARCH} ui${LIB_SUFFIX}${ARCH}
		LIBRARY DESTINATION "${INSTALL_DEFAULT_MODDIR}/legacy"
		ARCHIVE DESTINATION "${INSTALL_DEFAULT_MODDIR}/legacy"
	)
endif()

#
# etl_bin.pk3
#
if(BUILD_MOD_PK3)
	add_custom_target(mod_pk3 ALL DEPENDS legacy/etl_bin_${ETL_CMAKE_VERSION_SHORT}.pk3)

	if(APPLE)
		set(ZIP_FILE_LIST cgame${LIB_SUFFIX}${ARCH}* ui${LIB_SUFFIX}${ARCH}*)
	else()
		set(ZIP_FILE_LIST cgame${LIB_SUFFIX}${ARCH}${CMAKE_SHARED_LIBRARY_SUFFIX} ui${LIB_SUFFIX}${ARCH}${CMAKE_SHARED_LIBRARY_SUFFIX})
	endif()

	add_custom_command(
		OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/legacy/etl_bin_${ETL_CMAKE_VERSION_SHORT}.pk3
		COMMAND ${ZIP_EXECUTABLE} etl_bin_${ETL_CMAKE_VERSION_SHORT}.pk3 ${ZIP_FILE_LIST}
		DEPENDS cgame${LIB_SUFFIX}${ARCH} ui${LIB_SUFFIX}${ARCH}
		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/legacy/
	)

	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/legacy/etl_bin_${ETL_CMAKE_VERSION_SHORT}.pk3
		DESTINATION "${INSTALL_DEFAULT_MODDIR}/legacy"
	)
endif()
