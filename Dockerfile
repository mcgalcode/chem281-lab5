FROM python:3.9-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopenmpi-dev \
    openmpi-bin \    
    git

# Install pybind11
RUN pip3 install pybind11 mpi4py

# Create a working directory
WORKDIR /src

# Set the entrypoint to the bash shell
ENTRYPOINT ["/bin/bash"]