#!/bin/bash
INPUT=$1
OUTPUT=$2

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="biodckrdev/jellyfish:latest"

/bin/docker run \
    --volumes-from $CONTAINER_ID \
    --rm \
    $IMG \
        jellyfish \
            dump \
            $INPUT > $OUTPUT

