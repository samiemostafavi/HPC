#!/bin/bash

gcc -g -O2 matrix_multiply_naive_64.c -o matrix_multiply_naive_64.out
gcc -g -O2 matrix_multiply_opt_64.c -o matrix_multiply_opt_64.out
gcc -g -O2 matrix_multiply_naive_1000.c -o matrix_multiply_naive_1000.out
gcc -g -O2 matrix_multiply_opt_1000.c -o matrix_multiply_opt_1000.out

sudo perf stat -e L1-dcache-load-misses,L1-dcache-loads,LLC-loads,LLC-load-misses,instructions,cycles ./matrix_multiply_naive_64.out
sudo perf stat -e L1-dcache-load-misses,L1-dcache-loads,LLC-loads,LLC-load-misses,instructions,cycles ./matrix_multiply_opt_64.out
sudo perf stat -e L1-dcache-load-misses,L1-dcache-loads,LLC-loads,LLC-load-misses,instructions,cycles ./matrix_multiply_naive_1000.out
sudo perf stat -e L1-dcache-load-misses,L1-dcache-loads,LLC-loads,LLC-load-misses,instructions,cycles ./matrix_multiply_opt_1000.out
