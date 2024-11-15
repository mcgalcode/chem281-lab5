import sys
import os
import mpi4py.MPI as MPI

# Add the build directory to the Python path
sys.path.append(os.path.join(os.path.dirname(__file__), 'build'))

import lab_five

def main():
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()

    if rank == 0:
        result = lab_five.add(3, 5)
        print(f"The result of adding 3 and 5 is: {result}")

if __name__ == "__main__":
    main()