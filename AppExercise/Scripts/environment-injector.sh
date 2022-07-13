#!/usr/bin/env bash

ENV_FILE="$SRCROOT/Secrets/env.sh"
SECRETS_FILE="$SCRIPT_INPUT_FILE_0"
SECRETS_FILE_ORIG="${SCRIPT_INPUT_FILE_0}.swift-injector-orig"

if [ ! -f "${ENV_FILE}" ]; then
  # If the env.sh file is not found, that means we might be running the build on Bitrise.
  # In this case, we'll just exit the script silently, because Bitrise will handle
  exit 0
fi

if ! which variable-injector >/dev/null; then
    echo "WARNING: Swift Variable Injector not installed."
    exit 1
fi

source "$ENV_FILE"

# Make a copy of the secrets file so we can revert the changes later
cp "$SECRETS_FILE" "$SECRETS_FILE_ORIG"

variable-injector --file "$SECRETS_FILE" --verbose