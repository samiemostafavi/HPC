# Commands used for q3

nvcc -arch=sm_30 exercise_1.cu -o exercise_1
bash-4.2$ salloc --nodes=1 --gres=gpu:K420:1 -C Haswell -t 00:05:00 -A edu20.FDD3258
srun -n 1 ./exercise_1
