#!/bin/bash

echo "Question 2 part 1"

# RUN THIS BEFORE:
# salloc --nodes=1 -t 01:00:00 -A edu20.FDD3258
#-----------------------------------------

echo "export OMP_NUM_THREADS=16"
export OMP_NUM_THREADS=16

c_num=0
bw_arr=()
for i in {1..5}
do
   my_array=( $(srun -n 1 ./stream | sed -n -e 14p -e 27p) )
   c_num=${my_array[5]}
   bw=${my_array[7]}
   echo "Number of cores: $c_num, bw: $bw"
   bw_arr[${#bw_arr[@]}]=$bw
done

count=0;
total=0;

for i in $bw_arr
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
echo "scale=2; $total / $count" | bc


#-----------------------------------------


num_thread_arr=(1 2 4 8 12 16 20 24 28 32)
for n in "${num_thread_arr[@]}"
do
   echo "export OMP_NUM_THREADS=$n"
   export OMP_NUM_THREADS=$n
   c_num=0
   bw_arr=()
   my_array=( $(srun -n 1 ./stream | sed -n -e 14p -e 27p) )
   c_num=${my_array[5]}
   bw=${my_array[7]}
   echo "Number of cores: $c_num, bw: $bw"

done
