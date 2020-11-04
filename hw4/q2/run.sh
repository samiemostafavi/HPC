# The commands ran for Q2


cd /cfs/klemming/nobackup/s/ssmos
cp -rf /pdc/vol/cuda/cuda-10.0/samples/1_Utilities/bandwidthTest ./bandwidthTest
module load gcc/7.2.0 cuda/10.0
cd bandwidthTest
nvcc -arch=sm_30 -I/pdc/vol/cuda/cuda-10.0/samples/common/inc bandwidthTest.cu -o bandwidthTest
salloc --nodes=1 --gres=gpu:K420:1 -C Haswell -t 00:05:00 -A edu20.FDD3258
srun -n 1 ./bandwidthTest
srun -n 1 ./bandwidthTest --mode=shmoo
