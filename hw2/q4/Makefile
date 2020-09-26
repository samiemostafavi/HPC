
CC=gcc

all: DFTW_0 DFTW_1  release

DFTW_0: DFTW_0.c
	$(CC) -o DFTW_0 DFTW_0.c -fopenmp -lm

DFTW_1: DFTW_1.c
	$(CC) -o DFTW_1 DFTW_1.c -fopenmp -lm

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw2/q4/
RELEASE_FILES = DFTW_0 DFTW_1 run.sh run2.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
