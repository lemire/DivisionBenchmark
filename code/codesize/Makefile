all: remainder_compiler.o remainder_lkk.o divisibility_compiler.o divisibility_lkk.o divisibility_gm.o
	$(CC) --version
	objdump -d  remainder_lkk.o
	objdump -d  remainder_compiler.o
	objdump -d  divisibility_lkk.o
	objdump -d  divisibility_compiler.o
	objdump -d  divisibility_gm.o

divisor:="-DDIVISOR=95"

remainder_compiler.o: remainder_compiler.c 
	$(CC) -O3 -c remainder_compiler.c  $(divisor)

remainder_lkk.o: remainder_lkk.c 
	$(CC) -O3 -c remainder_lkk.c $(divisor)


divisibility_compiler.o: divisibility_compiler.c
	$(CC) -O3 -c divisibility_compiler.c $(divisor)

divisibility_lkk.o: divisibility_lkk.c
	$(CC) -O3 -c divisibility_lkk.c $(divisor)

divisibility_gm.o: divisibility_gm.c
	$(CC) -O3 -c divisibility_gm.c $(divisor)

clean: 
	rm -f remainder_compiler.o remainder_lkk.o divisibility_compiler.o divisibility_lkk.o
