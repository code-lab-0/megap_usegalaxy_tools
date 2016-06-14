#!/bin/bash
INPUT=$1
OUTPUT=$2
OPTION=${@:3}

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="emihat/cutadapt:latest"

/bin/docker run \
    --volumes-from $CONTAINER_ID \
    --rm \
    $IMG \
        cutadapt \
            $OPTION \
            -f fastq \
            -o $OUTPUT \
            $INPUT
