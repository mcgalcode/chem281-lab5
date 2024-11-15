cmake_minimum_required(VERSION 3.14)
project(LabFive VERSION 1.0
	            DESCRIPTION "Explorations of python bindings for C++"
		        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# Find pybind11
find_package(pybind11 REQUIRED)
find_package(MPI REQUIRED)
find_package(OpenMP REQUIRED)

# Include directories
include_directories(include)

# Add the main library
add_library(lab_five_cpp SHARED src/lab_five.cpp)
target_link_libraries(lab_five_cpp PUBLIC MPI::MPI_CXX)
target_link_libraries(lab_five_cpp PUBLIC OpenMP::OpenMP_CXX)

# Add the Python bindings
pybind11_add_module(lab_five python/bindings.cpp)
target_link_libraries(lab_five PRIVATE lab_five_cpp)