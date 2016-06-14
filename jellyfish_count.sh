#!/bin/bash
INPUT=$1
OUTPUT=$2
OPTION=${@:3}

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="biodckrdev/jellyfish:latest"

touch $OUTPUT
chmod 777 $OUTPUT

/bin/docker run \
    --volumes-from $CONTAINER_ID \
    --rm \
    $IMG \
        jellyfish \
            count \
            $OPTION \
            -C $INPUT \
            -o $OUTPUT

