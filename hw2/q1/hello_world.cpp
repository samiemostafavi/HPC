#include <iostream>
#include <omp.h>

using namespace std;

int main()
{
	int numThreads = omp_get_max_threads();
	omp_set_num_threads(numThreads);
#pragma omp parallel for
	for(int i=0;i<numThreads;i++)
		printf("Hello world from thread %d\n",omp_get_thread_num());
	return 0;
}
