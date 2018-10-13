#!/bin/bash
TIMEFORMAT=%R
PERFCMD="time" # could be perf stat
CCSTRINGS=("cc   -O3" )

for CCSTRING in "${CCSTRINGS[@]}" ; do
    echo "#" Machine `hostname`,  compiling with $CCSTRING
    CC_SEE_ASM="$CCSTRING -S"  #if multiple compilers, keep the last one
    echo '#*********************** SIGNED ******************************'
    echo "# divisor  lkk justdivlkk $LIBDIV_OPTS system slow"

    END=4096

    for ((i=2;i<=END;i++)); do
      s=$i
      outputs=()
      for opt in lkk justdivlkk $LIBDIV_OPTS system slow ; do
          touch a.out
          rm a.out
          $CCSTRING   hash_benchmark_${opt}.c -DD=$i
          $CC_SEE_ASM hash_benchmark_${opt}.c -DD=$i
          thisresult=$( { time ./a.out; } 2>&1 )
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
