#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include "lab_five.h"

namespace py = pybind11;

PYBIND11_MODULE(lab_five, m) {
    m.doc() = "Python binding module for lab 5";
    m.def("add", &add, "A function that adds two numbers using OpenMP and MPI");
}