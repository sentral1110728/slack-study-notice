#!/bin/sh -exv
docker run \
    --rm \
    -v "$PWD/infrastructure/modules/functions/$1/src":/var/task \
    -v "$PWD/infrastructure/modules/functions/$1/deps":/opt \
    lambci/lambda:build-python3.8 \
    pip install -r /var/task/requirements.txt -t /opt/python
