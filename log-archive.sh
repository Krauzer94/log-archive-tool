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

# Create log archive directory
LOG_DIR="$1"
ARCHIVE_DIR="$HOME/log_archive"
mkdir -p "$ARCHIVE_DIR"

# Timestamp name handling
TIMESTAMP=$(date + "Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# Compress the log files
LOGFILE="${ARCHIVE_DIR}/archive_log.txt"
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR"

# Execute chain
check_dir
