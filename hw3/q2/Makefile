
CC=cc

all: pi_mpi_blocking release

pi_par: pi_mpi_blocking.c
	$(CC) -o pi_mpi_blocking pi_mpi_blocking.c 

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw3/q2/
RELEASE_FILES = pi_mpi_blocking run.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
