#!/bin/bash

echo "Question 3 clock granularity results"

echo gcc clockgranularity.c -o clock.out

gcc clockgranularity.c -o clock.out

./clock.out 100

echo gcc clockgranularity_RDTSC.c -o clock_RDTSC.out

gcc clockgranularity_RDTSC.c -o clock_RDTSC.out

./clock_RDTSC.out 100

my_array=( $(sysctl hw.cpufrequency) )
clock_freq=${my_array[1]}
echo "CPU clock frequency: " $clock_freq

my_array=( $(./clock_RDTSC.out 100) )
total_val=${my_array[12]}
acc=$(($total_val/100))
echo "average clock cycles: " $acc
tm_val=$(echo "$acc/$clock_freq" | bc -l)
echo "RDTSC clock granularity: " $tm_val
