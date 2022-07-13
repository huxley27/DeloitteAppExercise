#!/usr/bin/env bash

ENV_FILE="$SRCROOT/Secrets/env.sh"
SECRETS_FILE="$SCRIPT_INPUT_FILE_0"
SECRETS_FILE_ORIG="${SCRIPT_INPUT_FILE_0}.swift-injector-orig"

if [ ! -f "${ENV_FILE}" ]; then
    # If the env.sh file is not found, that means we might be running the build on Bitrise.
    # In this case, we'll just exit the script silently, because Bitrise will handle
    exit 0
fi

if [ ! -f "${SECRETS_FILE}" ]; then
    # The secrets file doesn't exist so we'll just exit silently
    exit 0
fi

if [ ! -f "${SECRETS_FILE_ORIG}" ]; then
    # The original secrets file doesn't exist so we'll just exit silently
    exit 0
fi

mv "$SECRETS_FILE_ORIG" "$SECRETS_FILE"