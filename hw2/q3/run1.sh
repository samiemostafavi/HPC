#!/bin/bash

echo "Question 3 part 1"

# RUN THIS BEFORE:
# salloc --nodes=1 -t 01:00:00 -A edu20.FDD3258
#-----------------------------------------

echo "./maxloc"

srun -n 1 ./maxloc

echo "export OMP_NUM_THREADS=32"
export OMP_NUM_THREADS=32

echo "./maxloc_omp_parallelfor"

srun -n 1 ./maxloc_omp_parallelfor


#-----------------------------------------

echo "thread sweep - maxloc_omp_parallelfor -> "

num_thread_arr=(1 2 4 8 12 16 20 24 28 32)
for n in "${num_thread_arr[@]}"
do
   echo "export OMP_NUM_THREADS=$n"
   export OMP_NUM_THREADS=$n
   my_array=( $(srun -n 1 ./maxloc_omp_parallelfor) )
   c_num=${my_array[3]}
   echo "Average: $c_num"

done

echo "thread sweep - maxloc_omp_critical -> "

num_thread_arr=(1 2 4 8 12 16 20 24 28 32)
for n in "${num_thread_arr[@]}"
do
   echo "export OMP_NUM_THREADS=$n"
   export OMP_NUM_THREADS=$n
   my_array=( $(srun -n 1 ./maxloc_omp_critical) )
   c_num=${my_array[3]}
   echo "Average: $c_num"

done
