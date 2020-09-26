#!/bin/bash

echo "Question 2 - part 2"

# RUN THIS BEFORE
# salloc --nodes=1 -t 01:00:00 -A edu20.FDD3258
#-----------------------------------------

echo "export OMP_NUM_THREADS=32"
export OMP_NUM_THREADS=32

echo "schedule=static"

c_num=0
bw_arr=()
for i in {1..5}
do
   my_array=( $(srun -n 1 ./stream_static | sed -n -e 14p -e 27p) )
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
   my_array=( $(srun -n 1 ./stream_dynamic | sed -n -e 14p -e 27p) )
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
   my_array=( $(srun -n 1 ./stream_guided | sed -n -e 14p -e 27p) )
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
