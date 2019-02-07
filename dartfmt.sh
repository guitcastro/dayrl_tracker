#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

output=$(dartfmt ./ -n)
if [ -z $output]
then exit 0
else 
    exit 1
fi