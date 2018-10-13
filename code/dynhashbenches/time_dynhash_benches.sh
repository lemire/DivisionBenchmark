#!/bin/bash
TIMEFORMAT=%R
PERFCMD="time" # could be perf stat
CCSTRINGS=("cc -O3" )

for CCSTRING in "${CCSTRINGS[@]}" ; do
    echo "#" Machine `hostname`,  compiling with $CCSTRING
    CC_SEE_ASM="$CCSTRING -S"  #if multiple compilers, keep the last one
    echo '#*********************** UNSIGNED ******************************'
    echo "# divisor  lkk justdivlkk $LIBDIV_OPTS system "

    END=4096
    for opt in lkk justdivlkk $LIBDIV_OPTS system  ; do
       $CCSTRING  -o dynhash_benchmark_${opt}  dynhash_benchmark_${opt}.c
       $CC_SEE_ASM  dynhash_benchmark_${opt}.c
    done
    for ((i=2;i<=END;i++)); do
      s=$i
      outputs=()
      for opt in lkk justdivlkk $LIBDIV_OPTS system  ; do
         thisresult=$( { time ./dynhash_benchmark_${opt} $i; } 2>&1 )
          outputs+=($?)
          s+=" "$thisresult
      done
      refout=${outputs[0]}
      for oute in "${outputs[@]}"
      do
          if [ "$refout" != "$oute" ]
          then
            echo "bug? ${outputs[@]}"
            exit -1
          fi
      done
      echo $s
    done
    echo
    echo
done
