#!/bin/bash

echo "Question 2"

   
echo "Calculating communication bandwidht and latency using ping pong test"

echo "Running inter-node"
#salloc --nodes=1 -t 00:05:00 -A edu20.FDD3258 -C Haswell
srun -n 2 ./ping_pong > internode.txt
python best_fit.py internode.txt
#scancel -u ssmos
