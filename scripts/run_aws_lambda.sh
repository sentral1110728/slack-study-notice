#!/bin/sh -exv
cd infrastructire/environments/dev
eval "$(direnv export bash)"
aws lambda invoke --function--name "$1" ../../../tmp/outfile ${@:2:($#-1)}
