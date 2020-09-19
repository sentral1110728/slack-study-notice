#!/bin/sh -exv
cd infrastructure/environments/dev
eval "$(direnv export bash)"
aws ssm put-parameter --overwrite --name thankyou-dev-env --type SecureString --value file://.env.dev
