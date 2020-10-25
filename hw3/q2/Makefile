
CC=cc

all: pi_mpi_reduce pi_mpi_gather pi_mpi_blocking pi_mpi_nonblocking pi_mpi_blocking_binary release

pi_mpi_blocking: pi_mpi_blocking.c
	$(CC) -o pi_mpi_blocking pi_mpi_blocking.c 

pi_mpi_blocking_binary: pi_mpi_blocking_binary.c
	$(CC) -o pi_mpi_blocking_binary pi_mpi_blocking_binary.c 

pi_mpi_nonblocking: pi_mpi_nonblocking.c
	$(CC) -o pi_mpi_nonblocking pi_mpi_nonblocking.c 

pi_mpi_gather: pi_mpi_gather.c
	$(CC) -o pi_mpi_gather pi_mpi_gather.c 

pi_mpi_reduce: pi_mpi_reduce.c
	$(CC) -o pi_mpi_reduce pi_mpi_reduce.c 

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw3/q2/
RELEASE_FILES = pi_mpi_reduce pi_mpi_gather pi_mpi_blocking pi_mpi_nonblocking pi_mpi_blocking_binary run.sh run2.sh run3.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
