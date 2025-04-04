#!/usr/bin/env bash

# Exit on error
set -e

# Check if log directory is provided
check_dir() {
  if [ -z "$1" ]; then
    echo ""
    echo "Error: please provide a log directory"
    echo "Usage: $0 <log-directory>"
    echo ""
    exit 1
  fi
}

# Execute chain
check_dir
