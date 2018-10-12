#!/bin/bash

HOSTNAME=`hostname`

for SIGNED in unsigned signed; do
    for CONSTANT in constant invariant; do
	echo $SIGNED $CONSTANT
	echo "#************** Tests run `date` ********************" 
	./time_collatz_benches.sh $SIGNED $CONSTANT 
	
    done
done

