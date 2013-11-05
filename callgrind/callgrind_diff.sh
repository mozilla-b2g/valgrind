#!/bin/sh

if [ $# -lt 2 ]
then
    echo "./out_annotate_1.tmp file1 file2"
    exit
fi

FILE1=$1
FILE2=$2

CALLGRIND_ANNOTATE=~/mysoftware/valgrind-3.8.1/bin/callgrind_annotate
THRESHOLD=99

TMP1=out_annotate_1.tmp
TMP2=out_annotate_2.tmp
MIN_DIFF=0.5

${CALLGRIND_ANNOTATE} --threshold=${THRESHOLD} ${FILE1} > ${TMP1}
${CALLGRIND_ANNOTATE} --threshold=${THRESHOLD} ${FILE2} > ${TMP2}

 ./parse_annotate_out.pl ${TMP1} ${TMP2} ${MIN_DIFF}

 rm -f ${TMP1} ${TMP2}

