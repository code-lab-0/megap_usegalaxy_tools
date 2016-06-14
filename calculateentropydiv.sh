#!/bin/bash
INPUT=$1
OUTPUT=$2

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="perl:latest"

SCRIPTS_DIR=/home/okuda/data/megap_scripts

/bin/docker run \
    --volumes-from $CONTAINER_ID \
    -v $SCRIPTS_DIR:/scripts \
    --rm \
    $IMG \
        perl \
            /scripts/CalculateEntropyDiv \
            $INPUT > $OUTPUT

