#!/bin/bash

echo "Question 2"

#salloc --nodes=16 -t 00:05:00 -A edu20.FDD3258 -C Haswell
   
echo "Calculating Pi with MPI"

num_nodes_arr=(8 16 32 64 128 256 512 1024)
for n in "${num_nodes_arr[@]}"
do
   echo "Number of nodes=$n"
   srun -n $n ./pi_mpi_blocking
done

echo "Calculating Pi with MPI and Binary Tree Reduction Communication"

num_nodes_arr=(8 16 32 64 128 256 512 1024)
for n in "${num_nodes_arr[@]}"
do
   echo "Number of nodes=$n"
   srun -n $n ./pi_mpi_blocking_binary
done

