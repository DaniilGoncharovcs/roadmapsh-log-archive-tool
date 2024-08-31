#!/bin/bash

if [ -z "$1" ]; then
    echo "USAGE: create-test-logs.sh <logs_dir>"
    exit 1
fi

LOGS_DIR=$1

if ! [ -d "$LOGS_DIR" ]; then
    echo "$LOGS_DIR doesn't exist"
    exit 1
fi

if ! [ -w "$LOGS_DIR" ]; then
    echo "Current user $USER has no permission to write in directory $LOGS_DIR"
    exit 1
fi

for i in {1..5}; do
    fallocate -l 100M "$LOGS_DIR/$i.log"
done

echo "Test logs file was created"

