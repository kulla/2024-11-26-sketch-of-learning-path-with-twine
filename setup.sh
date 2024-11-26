#!/usr/bin/sh
#
# Script to install tweego

set -e

ZIP_FILE="$1"
TARGET_PATH="$2"

if [ -z "$ZIP_FILE" ] || [ -z "$TARGET_PATH" ]; then
  >&2 echo "Error: Arguments ZIP_FILE and TARGET_PATH cannot be empty"
  exit 1
fi

unzip "$ZIP_FILE" -d "$TARGET_PATH"
chmod +x "$TARGET_PATH/tweego"
