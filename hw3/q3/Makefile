
CC=cc

all: ping_pong release

ping_pong: ping_pong.c
	$(CC) -o ping_pong ping_pong.c 

RELEASE_DIR = /cfs/klemming/scratch/s/ssmos/hw3/q3/
RELEASE_FILES = ping_pong run1.sh run2.sh best_fit.py 
release: $(RELEASE_FILES)
	for u in $(RELEASE_FILES); do echo $$u; cp -f $$u $(RELEASE_DIR); done
