#!/usr/bin/env bash

# Exit on error
set -e

# Check if log directory is provided
if [ -z "$1" ]; then
  echo ""
  echo "Error: please provide a log directory"
  echo "Usage: ./log-archive <log-directory>"
  echo ""
  exit 1
fi

# Create log archive directory
LOG_DIR="$1"
ARCHIVE_DIR="$HOME/log_archive"
mkdir -p "$ARCHIVE_DIR"

# Timestamp name handling
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# Find all log files
LOG_FILES=$(find "$LOG_DIR" -type f -name "*.log")

# Check for non-log files
if [ -z "$LOG_FILES" ]; then
  echo ""
  echo "No log files were found in ${LOG_FILES}, nothing to archive"
  echo ""
  exit 0
else
  # Compress the log files
  tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" $(find "$LOG_DIR" -type f -name "*.log" -printf "%P\n")

  # Output the execution
  echo ""
  echo "Logs archived to ${ARCHIVE_PATH}"
  echo ""
fi
