#!/usr/bin/env sh

set -e

if [ -n "$(ping -c 2 8.8.8.8 | grep received)" ]; then
  echo "connected"
else
  echo "not connected"
fi
