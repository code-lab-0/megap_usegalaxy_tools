#!/bin/bash
INPUT=$1
OUTPUT=$2
OPTION=${@:3}

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="genomicpariscentre/bowtie2:latest"

MEGAPDATA_DIR=/home/okuda/data/megap_data

/bin/docker run \
    --volumes-from $CONTAINER_ID \
    -v $MEGAPDATA_DIR:/megapdata \
    --rm \
    $IMG \
        bowtie2 \
            $OPTION \
            -q \
            -x /megapdata/phiX174.Human.fasta.index \
            -U $INPUT \
            -S $OUTPUT \
            2> ${OUTPUT}.err
