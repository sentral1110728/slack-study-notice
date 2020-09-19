#!/bin/sh -exv
docker run \
    --rm \
    -v "$PWD/infrastructure/modules/functions/$1/src":/var/task:ro,delegated \
    -v "$PWD/infrastructure/modules/functions/$1/deps":/opt:ro,delegated \
    --env-file "$PWD/infrastructure/environments/dev/.env" \
    --env-file "$PWD/infrastructure/environments/dev/.env.dev" \
    lambci/lambda:python3.7 \
    lambda_function.lambda_handler $(printf '%s' $(cat scripts/$2.json))
