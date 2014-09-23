CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o non_recursive_fib.o

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
non_recursive_fib.o: non_recursive_fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

non_recursive_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq 1 &
QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq 0 &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
seq_no := 1 2 3 4 5 6 7 8 9 10
qemu: fibseq
	@for n in $(seq_no); do \
		((yes $$n | $(call QEMU_CMD)) && (sleep 1)); \
	done

qemu-non-reqursive: fibseq
	@for n in $(seq_no); do \
		((yes $$n | $(call non_recursive_CMD)) && (sleep 1)); \
	done

