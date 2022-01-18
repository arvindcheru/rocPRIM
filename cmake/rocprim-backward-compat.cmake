# ########################################################################
# Copyright 2021-2022 Advanced Micro Devices, Inc.
# ########################################################################
cmake_minimum_required(VERSION 3.16.8)

#Include Directory Paths for - wrapper.
set(PROJECT_WRAPPER_TEMPLATE_FILE          ${PROJECT_SOURCE_DIR}/header.hpp.in)
set(PROJECT_WRAPPER_MAIN_INC_DIR           ${PROJECT_BINARY_DIR}/include/rocprim)
set(PROJECT_WRAPPER_L1_INC_SUBDIR1         ${PROJECT_BINARY_DIR}/include/rocprim/block)
set(PROJECT_WRAPPER_L1_INC_SUBDIR2         ${PROJECT_BINARY_DIR}/include/rocprim/detail)
set(PROJECT_WRAPPER_L1_INC_SUBDIR3         ${PROJECT_BINARY_DIR}/include/rocprim/device)
set(PROJECT_WRAPPER_L1_INC_SUBDIR4         ${PROJECT_BINARY_DIR}/include/rocprim/intrinsics)
set(PROJECT_WRAPPER_L1_INC_SUBDIR5         ${PROJECT_BINARY_DIR}/include/rocprim/iterator)
set(PROJECT_WRAPPER_L1_INC_SUBDIR6         ${PROJECT_BINARY_DIR}/include/rocprim/types)
set(PROJECT_WRAPPER_L1_INC_SUBDIR7         ${PROJECT_BINARY_DIR}/include/rocprim/thread)
set(PROJECT_WRAPPER_L1_INC_SUBDIR8         ${PROJECT_BINARY_DIR}/include/rocprim/warp)
set(PROJECT_WRAPPER_L2_INC_SUBDIR1         ${PROJECT_BINARY_DIR}/include/rocprim/block/detail)
set(PROJECT_WRAPPER_L2_INC_SUBDIR2         ${PROJECT_BINARY_DIR}/include/rocprim/device/detail)
set(PROJECT_WRAPPER_L2_INC_SUBDIR3         ${PROJECT_BINARY_DIR}/include/rocprim/device/specialization)
set(PROJECT_WRAPPER_L2_INC_SUBDIR4         ${PROJECT_BINARY_DIR}/include/rocprim/iterator/detail)
set(PROJECT_WRAPPER_L2_INC_SUBDIR5         ${PROJECT_BINARY_DIR}/include/rocprim/warp/detail)


#Source Include File Directories, Level1 and Level2 Subdirectories
set(PROJECT_FREORG_MAIN_INC_DIR       ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim)
set(PROJECT_FREORG_L1_INC_SUBDIR1     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/block)
set(PROJECT_FREORG_L1_INC_SUBDIR2     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/detail)
set(PROJECT_FREORG_L1_INC_SUBDIR3     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/device)
set(PROJECT_FREORG_L1_INC_SUBDIR4     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/intrinsics)
set(PROJECT_FREORG_L1_INC_SUBDIR5     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/iterator)
set(PROJECT_FREORG_L1_INC_SUBDIR6     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/types)
set(PROJECT_FREORG_L1_INC_SUBDIR7     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/thread)
set(PROJECT_FREORG_L1_INC_SUBDIR8     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/warp)
set(PROJECT_FREORG_L2_INC_SUBDIR1     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/block/detail)
set(PROJECT_FREORG_L2_INC_SUBDIR2     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/device/detail)
set(PROJECT_FREORG_L2_INC_SUBDIR3     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/device/specialization)
set(PROJECT_FREORG_L2_INC_SUBDIR4     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/iterator/detail)
set(PROJECT_FREORG_L2_INC_SUBDIR5     ${PROJECT_SOURCE_DIR}/rocprim/include/rocprim/warp/detail)

#Relative Path for wrapper (include) files generated 
set(PROJECT_WRAPPER_MAIN_INC_RELPATH   "${include_statements}#include \"../../../include/rocprim")
set(PROJECT_WRAPPER_L1_SUBDIR1_RELPATH  "${include_statements}#include \"../../../../include/rocprim/block")
set(PROJECT_WRAPPER_L1_SUBDIR2_RELPATH  "${include_statements}#include \"../../../../include/rocprim/detail")
set(PROJECT_WRAPPER_L1_SUBDIR3_RELPATH  "${include_statements}#include \"../../../../include/rocprim/device")
set(PROJECT_WRAPPER_L1_SUBDIR4_RELPATH  "${include_statements}#include \"../../../../include/rocprim/intrinsics")
set(PROJECT_WRAPPER_L1_SUBDIR5_RELPATH  "${include_statements}#include \"../../../../include/rocprim/iterator")
set(PROJECT_WRAPPER_L1_SUBDIR6_RELPATH  "${include_statements}#include \"../../../../include/rocprim/types")
set(PROJECT_WRAPPER_L1_SUBDIR7_RELPATH  "${include_statements}#include \"../../../../include/rocprim/thread")
set(PROJECT_WRAPPER_L1_SUBDIR8_RELPATH  "${include_statements}#include \"../../../../include/rocprim/warp")
set(PROJECT_WRAPPER_L2_SUBDIR1_RELPATH  "${include_statements}#include \"../../../../../include/rocprim/block/detail")
set(PROJECT_WRAPPER_L2_SUBDIR2_RELPATH  "${include_statements}#include \"../../../../../include/rocprim/device/detail")
set(PROJECT_WRAPPER_L2_SUBDIR3_RELPATH  "${include_statements}#include \"../../../../../include/rocprim/device/specialization")
set(PROJECT_WRAPPER_L2_SUBDIR4_RELPATH  "${include_statements}#include \"../../../../../include/rocprim/iterator/detail")
set(PROJECT_WRAPPER_L2_SUBDIR5_RELPATH  "${include_statements}#include \"../../../../../include/rocprim/warp/detail")


# Function for Generating Wrapper Headers for Backward Compatibilty
# Generates wrapper for all *.h files in include/rocprim folder
# No Arguments to function.
# Wrapper are generated under rocprim/include/rocprim.
function (package_gen_bkwdcomp_hdrs)
	# Get list of *.h files in folder include/rocprim 
	file(GLOB include_files ${PROJECT_FREORG_MAIN_INC_DIR}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_MAIN_INC_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_MAIN_INC_DIR}/${file_name}")
		unset(include_statements)
	endforeach()

	# Get list of *.h files in folder include/rocprim/block 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR1}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR1_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR1}/${file_name}")
		unset(include_statements)
	endforeach()

	# Get list of *.h files in folder include/rocprim/detail 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR2}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR2_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR2}/${file_name}")
		unset(include_statements)
	endforeach()

	# Get list of *.h files in folder include/rocprim/device 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR3}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR3_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR3}/${file_name}")
		unset(include_statements)
	endforeach()

	# Get list of *.h files in folder include/rocprim/intrinsics 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR4}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR4_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR4}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/iterator 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR5}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR5_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR5}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/types 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR6}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR6_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR6}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/thread 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR7}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR7_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR7}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/warp 
	file(GLOB include_files ${PROJECT_FREORG_L1_INC_SUBDIR8}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L1_SUBDIR8_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L1_INC_SUBDIR8}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/block/detail
	file(GLOB include_files ${PROJECT_FREORG_L2_INC_SUBDIR1}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L2_SUBDIR1_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L2_INC_SUBDIR1}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/device/detail 
	file(GLOB include_files ${PROJECT_FREORG_L2_INC_SUBDIR2}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L2_SUBDIR2_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L2_INC_SUBDIR2}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/device/specialization 
	file(GLOB include_files ${PROJECT_FREORG_L2_INC_SUBDIR3}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L2_SUBDIR3_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L2_INC_SUBDIR3}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/iterator/detail 
	file(GLOB include_files ${PROJECT_FREORG_L2_INC_SUBDIR4}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L2_SUBDIR4_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L2_INC_SUBDIR4}/${file_name}")
		unset(include_statements)
	endforeach()

        # Get list of *.h files in folder include/rocprim/warp/detail 
	file(GLOB include_files ${PROJECT_FREORG_L2_INC_SUBDIR5}/*.hpp)
	# Convert the list of files into #includes
	foreach(include_file ${include_files})
		get_filename_component(file_name ${include_file} NAME)
		set(include_statements "${PROJECT_WRAPPER_L2_SUBDIR5_RELPATH}/${file_name}\"\n")
		configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_L2_INC_SUBDIR5}/${file_name}")
		unset(include_statements)
	endforeach()


endfunction()


# Function for Generating Wrapper Header for Backward Compatibilty
# Generates wrapper for gen_file_name given as input 
# gen_file_name -  Arguments to function (absolute file name) to give as input file for which wrapper header is generated
# Wrapper generated for the input file under rocprim/include/rocprim/.
function (package_gen_bkwdcomp_hdrfile gen_file_name)
        set(include_file ${gen_file_name})  
	get_filename_component( file_name ${include_file} NAME)
	set(include_statements "${PROJECT_WRAPPER_MAIN_INC_RELPATH}/${file_name}\"\n")
	configure_file(${PROJECT_WRAPPER_TEMPLATE_FILE} "${PROJECT_WRAPPER_MAIN_INC_DIR}/${file_name}")
	unset(include_statements)
endfunction()

