#!/bin/bash

set -e
set -o pipefail

# Check for any HTTP links, except for those that are part of an onion address
# or those that are part of the SVG XML spec
if grep -R -I -n -P \
   'http://(?![^[:space:]]*(\.onion|xml))' \
   --exclude-dir='_build' \
   --exclude='*.svg' \
   --exclude='conf.py' \
   docs/; then
  echo "HTTP links found"
  exit 1
fi

echo "No common errors found."
exit 0
