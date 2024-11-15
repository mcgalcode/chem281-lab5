# CHEM 281 - Lab 5: Python Bindings for C++ Code

As scientific software engineers, one of the most important qualities of the software products we create is accessibility. One place we've already touched on accessibility in this class is in our use of containerized development environments. By using containerized development environments we remove the onus of installing dependencies and curating a development environment from the person who adds onto or uses our software.

Today we will explroe anoter method for making our code accessible: **python bindings**. Many scientists who routinely use data scientific tools or other pieces of software use python as their programming language of choice. As a result, if the code you develop is a library of functionality instead of an executable, the community will be more likely to use it if they can use it from within a python program.

Python bindings allow you to expose your C++ code as an importable library in python. Though there are several methods for doing this, today we will use the [pybind11 package](https://pybind11.readthedocs.io/en/stable/index.html) to achieve this. This package allows you to python functions and classes from C++ and map them to the corresponding C++ entities. Note that it does NOT convert your code to python, it just makes it callable from a python process.

Why would we want to do this? The shortest answer is performance. In many cases, C++ implementations can be more performant than python implementations because they enable parallelism (as we've seen in this class) and more fine-grained memory management.

In this lab, we will explore the capabilities of the pybind11 package.

## 0. Setup

In this directory you will find a Dockerfile for building your development image. To build the image, you can run
```
>>> ./build_image.sh
```
If that doesn't work, copy the command inside of the `build_image.sh` script and run it directly in your terminal.

This build process may take a while because this image includes MPI, OpenMP, and mpi4py (the python binding for MPI)

To run a container where you can build the code, use

```
>>> ./run_image.sh
```

Similarly, copy the contents of the script to your command line and run it there if this script doesn't execute.

To build the code use the following:

```
>>> mkdir build
>>> cd build
>>> cmake -Dpybind11_DIR=/usr/local/lib/python3.8/dist-packages/pybind11/share/cmake/pybind11 ..
>>> make
```

Once you've build this code, try testing the binding by moving back to `/src/` and running:

```
>>> python test_bindings.py
```

**NOTE** We have to specify the location of the pip installed pybind11 cmake files.

Take a minute to explore the codebase here. It's pretty simple, but there are new aspects to it. The code in `src/` and `include/` implements a simple add function and the corresponding header file. In `python/` you will find code that uses pybind11 to define the way that python functions should be bound to your C++ functions. In this case, it's just the add function.

## Main Lab Exercises

There is no required specific task for this lab. Instead, a few concepts to explore are listed below. You can choose to work on these in any order and go into as much depth as you would like for each of them. You will need to consult the documentation for pybind11:

[DOCUMENTATION FOR PYBIND11 HERE](https://pybind11.readthedocs.io/en/stable/index.html)

### 1. Implement a more complicated function

Try implementing some more complicated functions with different signatures in C++. What data types can be returned and handled correctly in python?

### 2. Error handling

Can you raise an exception in C++ and then handle it in the python script? How does this type of communication work?

### 3. Implement a class in C++ and expose it

Can you make a class written in C++ available in python? Can you add member variables, or methods? What about static methods or variables?

### 4. Can you write a function that depends on OpenMP in C++ and expose that via python?

OpenMP should be available in the image for you to utilize in your source code. Try to make a function that implements the Monte Carlo pi estimation, or does a dot product, or some other calculation in C++ and then expose it via python bindings

### 5. Use MPI4Py to run MPI code in python

Can you use the MPI4py bindings to use MPI in python? The test_bindings.py script has a small example of this.