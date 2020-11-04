#include <stdio.h>

__global__ void device_saxpy(int n, float a, float * x, float * y)
{
	int i = blockIdx.x*blockDim.x + threadIdx.x;
	if (i < n) y[i] = a*x[i] + y[i];
}

void host_saxpy(int n, float a, float* x, float* y)
{
	for(int i=0;i<n;i++) y[i] = a*x[i] + y[i];
}

int main()
{
	int ARRAY_SIZE = 1<<10;

	// device saxpy arrays
	float * x1; 
	float * y1;
	float * d_x1;
	float * d_y1;

	// host saxpy arrays
	float * x2;
	float * y2;

	// Allocate host arrays
	x1 = (float*)malloc(sizeof(float) * ARRAY_SIZE);
	y1 = (float*)malloc(sizeof(float) * ARRAY_SIZE);
	x2 = (float*)malloc(sizeof(float) * ARRAY_SIZE);
	y2 = (float*)malloc(sizeof(float) * ARRAY_SIZE);

	// Initialize arrays
	for (int i=0; i<ARRAY_SIZE; i++)
	{
		x1[i] = (float)i+100.0;
		y1[i] = (float)-i;

		x2[i] = (float)i+100.0;
		y2[i] = (float)-i;
  	}

    	// Allocate device memory for x,y
    	cudaMalloc((void**)&d_x1, sizeof(float) * ARRAY_SIZE);
    	cudaMalloc((void**)&d_y1, sizeof(float) * ARRAY_SIZE);

	// Copy the device arrays
	cudaMemcpy(d_x1, x1, ARRAY_SIZE*sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(d_y1, y1, ARRAY_SIZE*sizeof(float), cudaMemcpyHostToDevice);

	// Perform SAXPY in the device
	printf("Computing SAXPY on the GPU...");
	device_saxpy<<<(ARRAY_SIZE+255)/256,256>>>(ARRAY_SIZE, 2.0, d_x1, d_y1);
	cudaDeviceSynchronize();
	printf("Done\n");

	// Copy back the results from the device
	cudaMemcpy(x1, d_x1, ARRAY_SIZE*sizeof(float), cudaMemcpyDeviceToHost);
	cudaMemcpy(y1, d_y1, ARRAY_SIZE*sizeof(float), cudaMemcpyDeviceToHost);

	// Perform SAXPY in the host 
	printf("Computing SAXPY on the CPU...");
	host_saxpy(ARRAY_SIZE,2.0,x2,y2);
	printf("Done\n");

	// Compare the results
	printf("Comparing the output for each implementation...");
	float max_error = 0.0001f;
	bool correct = true;
	for(int i=0;i<ARRAY_SIZE;i++)
	{
		if(abs(y1[i]-y2[i])>max_error)
			correct = false;
	}
	if(correct)
		printf("Correct :)\n");
	else
		printf("Incorrect :(\n");
			
	// Cleanup after executions
	cudaFree(d_x1);
	cudaFree(d_y1);
	free(x1);
	free(y1);
}

