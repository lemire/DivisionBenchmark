#!/bin/bash

HOSTNAME=`hostname`
mkdir -p timeresults

LOGFILECLANG=timeresults/variations-${HOSTNAME}-clang.txt
echo "************** Tests run `date` ********************" >>$LOGFILECLANG
./variation_dynhash_benches_clang.sh  >>$LOGFILECLANG 2>&1

LOGFILEGCC=timeresults/variations-${HOSTNAME}-gcc.txt
echo "************** Tests run `date` ********************" >>$LOGFILEGCC
./variation_dynhash_benches_gcc.sh  >>$LOGFILEGCC 2>&1
