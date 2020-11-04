#include <stdio.h>

__global__ void cuda_hello()
{
	printf("Hello World! My thread ID is %d \n",threadIdx.x);
}

int main() 
{
	cuda_hello<<<1,256>>>();
	cudaDeviceSynchronize();
	return 0;
}
