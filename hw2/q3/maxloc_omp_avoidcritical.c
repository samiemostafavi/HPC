#include <stdio.h>
#include <stdlib.h>  // rand(), srand()
#include <time.h>    // time()
#include <sys/time.h>
#include <math.h>
#include <omp.h>

#define N 1000000
#define TRIALS 20

double mysecond()
{
	struct timeval tp;
	struct timezone tzp;
	int i;

	i = gettimeofday(&tp,&tzp);
	return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

int main()
{
	double x[N];
	double t1,t2;
	double total = 0.0;
	double t[TRIALS];
	int MAX_THREADS = omp_get_max_threads();

	for (int j=0; j<TRIALS; j++)
	{
		// init x
		srand(time(0)); // seed
		for(int i=0; i<N;i++)
		{
			// Generate random number between 0 and 1
			x[i] = ((double)(rand()) / RAND_MAX)*((double)(rand()) / RAND_MAX)*((double)(rand()) / RAND_MAX)*1000;
		}

		// start clock
		t1 = mysecond();

		// search for maxval
		int maxloc[MAX_THREADS], mloc;
		double maxval[MAX_THREADS], mval;
		#pragma omp parallel shared(maxval,maxloc)
		{
			int id = omp_get_thread_num();
			maxval[id] = -1.0e30;

			#pragma omp parallel for
			for (int i=0; i < N; i++)
			{
				if (x[i] > maxval[id])
				{
					maxval[id] = x[i]; 
					maxloc[id] = i;
				}
			}
		}
		mloc = maxloc[0];
		mval = maxval[0];
		for (int i=1; i < MAX_THREADS; i++)
                {
                        if (maxval[i] > mval)
                        {
                        	mval = maxval[i];
                        	mloc = maxloc[i];
                	}
                }

		// stop clock
		t2 = mysecond();
		t[j] = t2-t1;
		total += t[j];

		//printf("maxval:%f, maxloc:%d\n",maxval,maxloc);

	}
	
	double mean = total / (double)TRIALS;
	double stddev = 0;
    	for (int j = 0; j < TRIALS; j++)
        	stddev += pow(t[j] - mean, 2);

	printf("Average time = %f, std dev = %f\n", mean,stddev);

	return 0;
}
