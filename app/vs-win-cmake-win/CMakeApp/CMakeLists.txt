# CMakeList.txt: CMakeApp 的 CMake 專案，在此包含來源及定義
# 專案專屬邏輯。
#
cmake_minimum_required (VERSION 3.8)
#
add_definitions(--std=c++11 -g)
#
project ("CMakeApp")
#
find_package(Boost REQUIRED)
include_directories(CMakeApp PRIVATE ${Boost_INCLUDE_DIRS})

# 將來源新增到此專案的可執行檔。
add_executable (CMakeApp "CMakeApp.cpp" "CMakeApp.h")

# TODO: 新增測試，並視需要安裝目標。
