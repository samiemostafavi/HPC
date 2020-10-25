#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <mpi.h>

#define SEED     921
#define NUM_ITER 16777216

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
	int count, rank, size, provided,i;
	double t1,t2;
	double pi;

  	MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
 	MPI_Comm_size(MPI_COMM_WORLD, &size);
  	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	t1 = MPI_Wtime();
  	// Everybody is sending to rank 0
  	if (rank == 0) {
		// Inits
		int* counts = malloc(size * sizeof(int));
		MPI_Request* reqs = malloc((size-1) * sizeof(MPI_Request));

		// non-blocking receives
		for (i=1; i<size; i++)
             		MPI_Irecv(&counts[i], 1, MPI_INT, i, MPI_ANY_TAG, MPI_COMM_WORLD, &reqs[i-1]);
		
		// rank 0 calculation
		counts[0] = calculate_pi_count(NUM_ITER/size,time(NULL)+123456789+ rank*100);
		
		// Wait for all to finish
		MPI_Waitall(size-1,reqs,MPI_STATUSES_IGNORE);
	
		// Sum of all counts
		for(int j=0; j<size; ++j)
			count += counts[j];
		
  	} else {

		count = calculate_pi_count(NUM_ITER/size, time(NULL)+123456789+ rank*100);
    		MPI_Send(&count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
  		MPI_Finalize();
		return 0;
  	}
		
    	
	// Estimate Pi and display the result
    	pi = ((double)count / (double)NUM_ITER) * 4.0;
	
	t2 = MPI_Wtime();
    	printf("The result is %f, time elapsed: %f\n", pi, t2-t1);
  	MPI_Finalize();
    	return 0;
}
