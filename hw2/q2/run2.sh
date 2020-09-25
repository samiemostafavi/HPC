#!/bin/bash

echo "Question 2"

gcc stream_static.c -fopenmp -o stream_static
gcc stream_dynamic.c -fopenmp -o stream_dynamic
gcc stream_guided.c -fopenmp -o stream_guided

#-----------------------------------------

echo "export OMP_NUM_THREADS=32"
export OMP_NUM_THREADS=32

echo "schedule=static"

c_num=0
bw_arr=()
for i in {1..5}
do
   my_array=( $(./stream_static | sed -n -e 14p -e 27p) )
   c_num=${my_array[5]}
   bw=${my_array[7]}
   echo "Number of cores: $c_num, bw: $bw"
   bw_arr[${#bw_arr[@]}]=$bw
done

count=0;
total=0;

for i in "${bw_arr[@]}"
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
echo "scale=2; $total / $count" | bc

echo "schedule=dynamic"

c_num=0
bw_arr=()
for i in {1..5}
do
   my_array=( $(./stream_dynamic | sed -n -e 14p -e 27p) )
   c_num=${my_array[5]}
   bw=${my_array[7]}
   echo "Number of cores: $c_num, bw: $bw"
   bw_arr[${#bw_arr[@]}]=$bw
done

count=0;
total=0;

for i in "${bw_arr[@]}"
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
echo "scale=2; $total / $count" | bc

echo "schedule=guided"

c_num=0
bw_arr=()
for i in {1..5}
do
   my_array=( $(./stream_guided | sed -n -e 14p -e 27p) )
   c_num=${my_array[5]}
   bw=${my_array[7]}
   echo "Number of cores: $c_num, bw: $bw"
   bw_arr[${#bw_arr[@]}]=$bw
done

count=0;
total=0;

for i in "${bw_arr[@]}"
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
echo "scale=2; $total / $count" | bc
