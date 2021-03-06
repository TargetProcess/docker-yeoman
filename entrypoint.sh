#!/usr/bin/env bash

USER_ID=${LOCAL_USER_ID:-1000}
GROUP_ID=${LOCAL_GROUP_ID:-1000}

groupmod -g ${GROUP_ID} node && usermod -u ${USER_ID} -g ${GROUP_ID} node
chown -R node:node /generated

# split off the first argument as the generator name
GENERATOR_NAME="$1"

su-exec node yo "${GENERATOR_NAME}" "${@:2}" --no-insight --skip-install