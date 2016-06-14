#!/bin/bash
INPUT=$1
OUTPUT=$2

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="perl:latest"

SCRIPTS_DIR=/home/okuda/data/megap_scripts
MEGAPDATA_DIR=/home/okuda/data/megap_data

docker run \
    --volumes-from $CONTAINER_ID \
    -v $SCRIPTS_DIR:/scripts \
    -v $MEGAPDATA_DIR:/megapdata \
    --rm \
    $IMG \
        perl \
            /scripts/Qual_Filter_FASTQFASTA \
            $INPUT \
            /megapdata/ascii

mv ${INPUT}.fasta $OUTPUT

