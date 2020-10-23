#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <mpi.h>

#define SEED     921
#define NUM_ITER 1000000000

int calculate_pi_count(int num_iter, int seed)
{
	int count = 0;
    	double x, y, z;

    	srand(seed); // Important: Multiply SEED by "rank" when you introduce MPI!

    	// Calculate PI following a Monte Carlo method
    	for (int iter = 0; iter < num_iter; iter++)
    	{
        	// Generate random (X,Y) points
        	x = (double)random() / (double)RAND_MAX;
        	y = (double)random() / (double)RAND_MAX;
        	z = sqrt((x*x) + (y*y));

        	// Check if point is in unit circle
        	if (z <= 1.0)
			count++;
    	}
	return count;
}

int main(int argc, char* argv[])
{
	int rank, size, provided,i;
	double t1,t2;
	double pi;

  	MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
 	MPI_Comm_size(MPI_COMM_WORLD, &size);
  	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	int count;

  	// Everybody is sending to rank 0
  	if (rank == 0) {
		t1 = MPI_Wtime();
		count = calculate_pi_count(NUM_ITER/size, rank*SEED);
       		for (i=1; i<size; i++)  // note that we start from rank 1
		{
			int r_count = 0;
             		MPI_Recv(&r_count, 1, MPI_INT, i, 0, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
			count += r_count;
		}
		t2 = MPI_Wtime();
  	} else {
		count = calculate_pi_count(NUM_ITER/size, rank*SEED);
    		MPI_Send(&count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
  		MPI_Finalize();
		return 0;
  	}
    	
	// Estimate Pi and display the result
    	pi = ((double)count / (double)NUM_ITER) * 4.0;
    	printf("The result is %f, time elapsed: %f\n", pi, t2-t1);
  	MPI_Finalize();
    	return 0;
}
