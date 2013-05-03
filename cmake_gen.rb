project_name = ARGV[0].to_s
cmakelist_file_path = './project/CMakeLists.txt'

$> = File.new(cmakelist_file_path, "w+")

puts <<EOL
macro(source_group_by_dir source_files)
	set(sgbd_cur_dir ${CMAKE_CURRENT_SOURCE_DIR})
	foreach(sgbd_file ${${source_files}})
		string(REGEX REPLACE ${sgbd_cur_dir}/\\(.*\\) \\\\1 sgbd_fpath ${sgbd_file})
		string(REGEX REPLACE "\\(.*\\)/.*" \\\\1 sgbd_group_name ${sgbd_fpath})
		string(COMPARE EQUAL ${sgbd_fpath} ${sgbd_group_name} sgbd_nogroup)
		if(MSVC)
			string(REPLACE "/" "\\\\" sgbd_group_name ${sgbd_group_name})
		endif(MSVC)
		if(sgbd_nogroup)
			set(sgbd_group_name "\\\\")
		endif(sgbd_nogroup)
		source_group(${sgbd_group_name} FILES ${sgbd_file})
	endforeach(sgbd_file)
endmacro(source_group_by_dir)

cmake_minimum_required(VERSION 2.8)

project(#{project_name})

include_directories(
	"../include"
	"../test/include"
	"../test/tools/include"
)

link_directories("#{Dir.pwd}/test/tools/lib")

file(GLOB_RECURSE code_headers ../include/*.h)
file(GLOB_RECURSE test_headers ../test/include/*.h)
file(GLOB_RECURSE tools_headers ../test/tools/include/*.h)
file(GLOB_RECURSE code_source ../src/*.cpp)
file(GLOB_RECURSE test_source ../test/src/*.cpp)

add_definitions(-D__UNIT_TEST__)

set(ALL_FILES ${code_headers} ${test_headers} ${tools_headers} ${code_source} ${test_source})

source_group_by_dir(ALL_FILES)

add_executable(#{project_name} ${ALL_FILES} )

target_link_libraries(#{project_name} gtest)


EOL