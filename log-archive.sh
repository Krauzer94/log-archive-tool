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

# Create arquive log directory
archive_dir() {
  LOG_DIR="$1"
  ARCHIVE_DIR="/var/archive"
  mkdir -p "$ARCHIVE_DIR"
}

# Execute chain
check_dir
