#!/bin/sh

if [[ $# -eq 0 ]]; then
  echo 'Version missing. Usage:'
  echo "$0 <version, eg. v1.0.0>"
  exit 1
fi

docker build -t klecks .

docker tag klecks "863419159770.dkr.ecr.eu-north-1.amazonaws.com/klecks:$1"
