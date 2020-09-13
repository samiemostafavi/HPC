#!/bin/bash

echo "Question 3 results"

gcc -O2 benchmark_5000.c -o benchmark_5000.out
res=0
for i in {1..50}
do
   my_array=( $(./benchmark_5000.out) )
   t_val=${my_array[2]}
   res=$(echo "$res+$t_val" | bc -l)
done
res=$(echo "$res/50" | bc -l)
echo average of 50 N=5000 runs [O2]: "$res"

gcc -O2 benchmark_100k.c -o benchmark_100k.out
res=0
for i in {1..50}
do
   my_array=( $(./benchmark_100k.out) )
   t_val=${my_array[2]}
   res=$(echo "$res+$t_val" | bc -l)
done
res=$(echo "$res/50" | bc -l)
echo average of 50 N=100k runs [O2]: "$res"

gcc -S -fverbose-asm -O2 benchmark_5000.c 

echo assembly code is generated

gcc -O0 benchmark_5000.c -o benchmark_5000_o0.out

res=0
for i in {1..50}
do
   my_array=( $(./benchmark_5000_o0.out) )
   t_val=${my_array[2]}
   res=$(echo "$res+$t_val" | bc -l)
done
res=$(echo "$res/50" | bc -l)
echo average of 50 N=5000 runs [No -O2]: "$res"


gcc -O0 benchmark_100k.c -o benchmark_100k_o0.out

res=0
for i in {1..50}
do
   my_array=( $(./benchmark_100k_o0.out) )
   t_val=${my_array[2]}
   res=$(echo "$res+$t_val" | bc -l)
done
res=$(echo "$res/50" | bc -l)
echo average of 50 N=100k runs [No -O2]: "$res"

gcc -O2 benchmark_5000_mod.c -o benchmark_5000_mod.out

res=0
tmin=10000
for i in {1..50}
do
   my_array=( $(./benchmark_5000_mod.out) )
   t_val=${my_array[2]}
   res=$(echo "$res+$t_val" | bc -l)
   if (( $(echo "$tmin > $t_val" |bc -l) )); then
      tmin=$t_val
   fi
done
res=$(echo "$res/50" | bc -l)
echo average of 50 N=5000 runs [MOD O2]: "$res", min: "$tmin"

gcc -O2 benchmark_100k_mod.c -o benchmark_100k_mod.out

res=0
tmin=10000
for i in {1..50}
do
   my_array=( $(./benchmark_100k_mod.out) )
   t_val=${my_array[2]}
   res=$(echo "$res+$t_val" | bc -l)
   if (( $(echo "$tmin > $t_val" |bc -l) )); then
      tmin=$t_val
   fi
done
res=$(echo "$res/50" | bc -l)
echo average of 50 N=100k runs [MOD O2]: "$res", min: "$tmin"

gcc -S -fverbose-asm -O2 benchmark_5000_mod.c

echo assembly code is generated

