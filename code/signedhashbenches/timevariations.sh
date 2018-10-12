#!/bin/bash

HOSTNAME=`hostname`
mkdir -p timeresults

LOGFILEGCC=timeresults/variation-data-${HOSTNAME}-gcc.txt 
echo "************** Tests run `date` ********************" >>$LOGFILEGCC
./variation_hash_benches_gcc.sh  >>$LOGFILEGCC 2>&1

LOGFILECLANG=timeresults/variation-data-${HOSTNAME}-clang.txt 
echo "************** Tests run `date` ********************" >>$LOGFILECLANG
./variation_hash_benches_clang.sh  >>$LOGFILECLANG 2>&1

