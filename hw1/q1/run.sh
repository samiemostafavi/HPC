#!/bin/bash

echo "Question 1 results"

my_array=( $(sysctl hw.cpufrequency) )
clock_freq=${my_array[1]}
echo "CPU clock frequency: " $clock_freq



nrows_arr=(10 100 1000 10000)
T_arr=()
i=0
for nrow in "${nrows_arr[@]}"
do 
   res_array=( $(./spmv.out $nrow) )
   T_arr[${#T_arr[@]}]=${res_array[8]}
   nnz_arr[${#nnz_arr[@]}]=${res_array[5]//[^0-9]/}
   echo "./spmv.out " $nrow 
   echo "	nnz= ${nnz_arr[$i]}"
   echo "	measured total exec time= ${T_arr[$i]} "
   T_res=${T_arr[$i]}
   nnz_res=${nnz_arr[$i]}
   flops_val=$(echo "2 * $nnz_res / $T_res / 1000000" | bc -l)
   tm_val=$(echo "2*$nnz_res/$clock_freq" | bc -l)
   echo "	modelled total exec time=" $tm_val
   echo "	"$flops_val" MFLOPS/s"
   readbw_val=$(echo "($nnz_res*12 + ($nrow^2)*12)/$T_res/1000000" | bc -l)
   echo "	"$readbw_val" MB/s"
   i=$((i+1))
done

