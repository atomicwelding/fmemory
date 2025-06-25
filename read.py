from scipy.io import FortranFile
import numpy as np

DIM = 10
dtype=np.float64

# read sequential
f = FortranFile("memseq.dat", "r")
print("Sequential :")
print(f.read_reals(dtype).reshape((DIM,DIM)))

# read stream
f = np.fromfile("memstr.dat", dtype=dtype).reshape((DIM,DIM))
print("Stream :")
print(f)


# read stream by frames
f = np.fromfile("memframe.dat", dtype=dtype).reshape((3, DIM, DIM))
print("Frames :")
print(f)
