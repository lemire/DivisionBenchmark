#!/bin/bash
CC_OPTS="-march=native -O3"  #default had include -mbmi2
PERFCMD="time"   # alternatives are time and perf stat
REPS=1 
CCSTRINGS=("cc $CC_OPTS")


for CCSTRING in "${CCSTRINGS[@]}" ; do

    echo Machine `hostname`,  compiling with $CCSTRING

    CC_SEE_ASM="$CCSTRING -S"  #if multiple compilers, keep the last one


    echo '*********************** UNSIGNED ******************************'
    #pulled out 16_gm 16_lkk
    for opt in gm lkk gm_general lkk_general    system ; do
	touch a.out
	rm a.out
	$CCSTRING   primes_benchmark_${opt}.c
	$CC_SEE_ASM primes_benchmark_${opt}.c
	echo ================ $opt ===================
	ctr=0
	while [[ ctr -lt REPS ]]; do
	    echo trial $ctr
 	    $PERFCMD ./a.out
	    ctr=$(( ctr+1 ))
	done
    done

    echo '*********************** SIGNED ******************************'
    for opt in gm lkk gm_general lkk_general $LIBDIV_OPTS system ; do
	touch a.out
	rm a.out
	$CCSTRING   primes_benchmark_${opt}_signed.c
	$CC_SEE_ASM primes_benchmark_${opt}_signed.c
	echo ================ $opt signed ===================
	ctr=0
	while [[ ctr -lt REPS ]]; do
 	    $PERFCMD ./a.out
	    ctr=$(( ctr+1 ))
	done
    done

done
