
CC=gcc

all: stream stream_static stream_dynamic stream_guided release

stream: stream.c
	$(CC) -o stream stream.c -fopenmp

stream_static: stream_static.c
	$(CC) -o stream_static stream_static.c -fopenmp

stream_dynamic: stream_dynamic.c
	$(CC) -o stream_dynamic stream_dynamic.c -fopenmp

stream_guided: stream_guided.c
	$(CC) -o stream_guided stream_guided.c -fopenmp

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw2/q2/
RELEASE_FILES = stream stream_static stream_dynamic stream_guided run1.sh run2.sh
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
