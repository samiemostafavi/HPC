#!/bin/bash

echo "Question 2"

   
echo "Calculating communication bandwidht and latency using ping pong test"

echo "Running intra-node: "
#salloc --nodes=2 -t 00:05:00 -A edu20.FDD3258 -C Haswell
srun -n 2 --ntasks-per-node=1 ./ping_pong > intranode.txt
python best_fit.py intranode.txt
#scancel -u ssmos

