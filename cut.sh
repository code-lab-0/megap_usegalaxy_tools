#!/bin/bash
INPUT=$1
OUTPUT=$2
OPTION=${@:3}

CONTAINER_ID=`cat /proc/1/cpuset`
CONTAINER_ID="${CONTAINER_ID##*/}"

IMG="busybox:latest"

docker run \
    --volumes-from $CONTAINER_ID \
    --rm \
    $IMG \
        cut \
            $OPTION \
            $INPUT > $OUTPUT

chmod 777 $OUTPUT

