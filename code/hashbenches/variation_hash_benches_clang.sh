#!/bin/bash
TIMEFORMAT=%R
LIBDIV_OPTS="libdivide libdivide_branchless"  #x64 where we have libdivide
PERFCMD="time" # could be perf stat
NUMTRIALS=10
CCSTRINGS=("clang -march=native -O3" )
case `hostname` in
       knightslanding.licef.ca)
     ;;
       zeal)
           ;;
       strife)
           ;;
        MacBook-Air.local)
            ;;
       skylake)
            ;;
       Softiron)
     #assume GCC?
     CCSTRINGS=("/opt/clang+llvm-4.0.0-aarch64-linux-gnu/bin/clang-4.0 -march=armv8-a -O3")
     LIBDIV_OPTS=    #none, for ARM
            ;;
       *)
     echo unknown hostname, please add in variation_hash_benches_clang.sh
     exit
   esac
for CCSTRING in "${CCSTRINGS[@]}" ; do
    echo "#" Machine `hostname`,  compiling with $CCSTRING
    echo '#*********************** UNSIGNED ******************************'
    echo "# divisor  lkk justdivlkk $LIBDIV_OPTS system slow"

    END=64 #4096

    #just certain values of divisor
    maxvariation=0
    for ((i=3;i<=END;i=i*3/2)); do
	outputs=()
	for opt in lkk justdivlkk $LIBDIV_OPTS system slow ; do
	    s="$i $opt"
            touch a.out
            rm a.out
            $CCSTRING   hash_benchmark_${opt}.c -DD=$i
	    maxtime=0
	    mintime=10000000
	    for ((repts=0;repts<NUMTRIALS;repts++)); do
		thisresult=$( { time ./a.out; } 2>&1 )
		if (( $(echo "$thisresult > $maxtime"  | bc -l) )) ; then
		    maxtime=$thisresult
		fi
		if (( $(echo "$thisresult < $mintime"  | bc -l) )) ; then
		    mintime=$thisresult
		fi
		outputs+=($?)
		s+=" "$thisresult
	    done
	    variation=$(echo "scale=3;($maxtime-$mintime) / $mintime" | bc -l)
	    if (( $(echo "$variation > $maxvariation"  | bc -l) )) ; then
		maxvariation=$variation
	    fi
	    s+=" $maxtime $mintime $variation"
	    echo $s
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
    done
    echo Maximum variation seen is $maxvariation
    echo
done
