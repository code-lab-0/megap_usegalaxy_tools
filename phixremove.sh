#!/bin/bash
INPUT_FQ=$1
INPUT_SAM=$2
OUTPUT=$3

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
            /scripts/PhixRemove \
            $INPUT_FQ \
            $INPUT_SAM

mv ${INPUT_FQ}.rem $OUTPUT
