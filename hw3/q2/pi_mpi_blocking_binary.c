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
	int real_rank, rank, real_size, size, provided,i;
	double t1,t2;
	double pi;

  	MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
 	MPI_Comm_size(MPI_COMM_WORLD, &real_size);
  	MPI_Comm_rank(MPI_COMM_WORLD, &real_rank);
	size = real_size;
	rank = real_rank;

	t1 = MPI_Wtime();

	// make the calculation	
	int count = calculate_pi_count(NUM_ITER/real_size, time(NULL)+123456789+ real_rank*100);
	
	// tree height
	i = 0;
	// Check the size of active nodes
	while(size > 1)
	{
  		// Everybody is sending to an even rank
  		if (rank % 2 == 0) {
			int r_count = 0;
             		MPI_Recv(&r_count, 1, MPI_INT, (rank+1)*(int)(pow(2,i)), 0, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
			count += r_count;
  		} else {
    			MPI_Send(&count, 1, MPI_INT, (rank-1)*(int)(pow(2,i)), 0, MPI_COMM_WORLD);
  			MPI_Finalize();
			return 0;
  		}
		size = size / 2;
		rank = rank / 2;
		i++;
	}
	
	// Estimate Pi and display the result
    	pi = ((double)count / (double)NUM_ITER) * 4.0;
	t2 = MPI_Wtime();

    	printf("The result is %f, time elapsed: %f\n", pi, t2-t1);
  	MPI_Finalize();
    	return 0;
}
