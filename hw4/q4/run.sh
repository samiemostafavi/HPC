# Commands used for q4

module load gcc/7.2.0 cuda/10.0
nvcc -arch=sm_30 exercise_2.cu -o exercise_2
salloc --nodes=1 --gres=gpu:K420:1 -C Haswell -t 00:05:00 -A edu20.FDD3258
srun -n 1 ./exercise_2
