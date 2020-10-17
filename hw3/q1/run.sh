#!/bin/bash

echo "Question 1"


#salloc --nodes=1 -t 00:05:00 -A edu20.FDD3258 -C Haswell

srun -n 4 ./hello_world_mpi

