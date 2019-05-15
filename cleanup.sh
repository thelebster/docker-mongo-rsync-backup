#!/bin/sh
set -e

# Keep backups for the last 7 days.
find $DOCKER_PATH -mtime +7 -type f -delete
