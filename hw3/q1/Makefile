
CC=cc

all: hello_world_mpi release

hello_world: hello_world_mpi.c
	$(CC) -o hello_world_mpi hello_world_mpi.c 

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw3/q1/
RELEASE_FILES = hello_world_mpi run.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
