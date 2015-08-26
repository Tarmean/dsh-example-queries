#!/bin/bash

db=${1}

echo $db

function do_benchmark {
    qfile=${1}
    echo "Running " ${qfile}
    for i in `seq 1 10`; do
        echo ${i}
        echo "explain analyze " | cat - ${qfile} | psql ${db} >> `basename ${qfile} .sql`.log;
    done
}

for q in *; do
    echo "Query " ${q}
    cd ${q}
    for s in *.sql; do
        do_benchmark ${s}
    done
    cd ..
done

