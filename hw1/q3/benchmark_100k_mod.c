#define N 100000
#define M 100
#include <stdio.h>
#include <sys/time.h>

double mysecond();

int main(){
  int i, j;
  double t1, t2; // timers                                                         
  double a[N], b[N], c[N]; // arrays  
  double tm = 0;
  double dummy = 0;        
       
  // init arrays                                                                   
  for (i = 0; i < N; i++){
    a[i] = 47.0;
    b[i] = 3.1415;
  }

  // Avoid cold start
  for(i = 0; i < N; i++)
    c[i] = a[i]*b[i];
  	
  for(i = 0; i < N; i++)
    dummy = dummy + c[i];

  // measure performance
  t1 = mysecond();
  for(j = 0; j< M; j++)
  {                                                          
  	for(i = 0; i < N; i++)
     	  c[i] = a[i]*b[i];
  }
  t2 = mysecond();

  for(i = 0; i < N; i++)
    dummy = dummy + c[i];

  tm = (t2 - t1)/(double)M;
  
  // take average
  printf("Execution time: %11.8f s, dummy: %f\n", tm, dummy);
  return 0;
}

// function with timer                                                             
double mysecond(){
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp,&tzp);
  return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}
