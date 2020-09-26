#!/bin/bash

echo "Question 4"

# RUN THIS BEFORE:
# salloc --nodes=1 -t 01:00:00 -A edu20.FDD3258
#-----------------------------------------

echo "Parallelized DFT by openmp-> "

num_thread_arr=(1 2 4 8 12 16 20 24 28 32)
for n in "${num_thread_arr[@]}"
do
   echo "export OMP_NUM_THREADS=$n"
   export OMP_NUM_THREADS=$n
   my_array=( $(srun -n 1 ./DFTW_1) )
   c_num=${my_array[3]}
   echo "Average: $c_num"

done
