#! /bin/bash

if [ $# -ne 2 ];then
    exit 1
fi

echo $1
echo $2
export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2

exec bash
