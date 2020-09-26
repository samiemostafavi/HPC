
CC=g++

all: hello_world release

hello_world: hello_world.cpp
	$(CC) -o hello_world hello_world.cpp -fopenmp

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw2/q1/
RELEASE_FILES = hello_world run.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
