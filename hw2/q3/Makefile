
CC=gcc

all: maxloc maxloc_omp_parallelfor maxloc_omp_critical maxloc_omp_avoidcritical maxloc_omp_padding release

maxloc: maxloc.c
	$(CC) -o maxloc maxloc.c -lm

maxloc_omp_parallelfor: maxloc_omp_parallelfor.c
	$(CC) -o maxloc_omp_parallelfor maxloc_omp_parallelfor.c -fopenmp -lm

maxloc_omp_critical: maxloc_omp_critical.c
	$(CC) -o maxloc_omp_critical maxloc_omp_critical.c -fopenmp -lm

maxloc_omp_avoidcritical: maxloc_omp_avoidcritical.c
	$(CC) -o maxloc_omp_avoidcritical maxloc_omp_avoidcritical.c -fopenmp -lm

maxloc_omp_padding: maxloc_omp_padding.c
	$(CC) -o maxloc_omp_padding maxloc_omp_padding.c -fopenmp -lm


RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw2/q3/
RELEASE_FILES = maxloc_omp_parallelfor maxloc_omp_critical maxloc_omp_avoidcritical maxloc_omp_padding maxloc run1.sh run2.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
