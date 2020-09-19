#!/bin/sh -exv
cd infrastructure/environments/dev
eval "$(direnv export bash)"
[[ -e .env.dev ]] && cp .env.dev .env.dev.bk
aws ssm get-parameter --name thankyou-dev-env --with-decryption | jq -r ".Parameter.Value" > .env.dev
