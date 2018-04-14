#!/bin/bash
[[ $DEBUG ]] && set -x
unset DEBUG

ARG=''
MOUNT_DIR=${MOUNT_DIR:-/mnt}

[[ $REGION ]] && ARG="$ARG --region $REGION"
[[ $STAT_CACHE_TTL ]] && ARG="$ARG --stat-cache-ttl $STAT_CACHE_TTL"
[[ $TYPE_CACHE_TTL ]] && ARG="$ARG --type-cache-ttl $TYPE_CACHE_TTL"
[[ $DIR_MODE ]] && ARG="$ARG --dir-mode $DIR_MODEN"
[[ $FILE_MODE ]] && ARG="$ARG --file-mode $FILE_MODE"

goofys -f $ARG $BUCKET $MOUNT_DIR
