#!/bin/bash

echo "Question 4"

# RUN THIS BEFORE:
# salloc --nodes=1 -t 01:00:00 -A edu20.FDD3258
#-----------------------------------------

echo "Default DFT -> "

srun -n 1 ./DFTW_0

echo "Parallelized DFT -> "

echo "export OMP_NUM_THREADS=32"
export OMP_NUM_THREADS=32

t_arr=()
for i in {1..5}
do
   my_array=( $(srun -n 1 ./DFTW_1 | sed -n -e 2p) )
   time=${my_array[3]}
   echo "Time: $time"
   t_arr[${#t_arr[@]}]=$time
done

count=0;
total=0;

for i in "${t_arr[@]}"
   do
     total=$(echo $total+$i | bc )
     ((count++))
   done
echo "Average: "
echo "scale=2; $total / $count" | bc


#------------------------------------------

#echo "Parallelized DFT by openmp-> "

#num_thread_arr=(1 2 4 8 12 16 20 24 28 32)
#for n in "${num_thread_arr[@]}"
#do
#   echo "export OMP_NUM_THREADS=$n"
#   export OMP_NUM_THREADS=$n
 #  my_array=( $(srun -n 1 ./maxloc_omp_padding) )
 #  c_num=${my_array[3]}
 #  echo "Average: $c_num"

#done
