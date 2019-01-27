#!/bin/sh
set -e

# ISO-8601 compliant date and time
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

FILENAME=$DATE.gz

/usr/bin/mongodump \
  --host $MONGODB_HOST \
  --port $MONGODB_PORT \
  --db $MONGODB_DATABASE \
  --username $MONGODB_USERNAME \
  --password $MONGODB_PASSWORD \
  --authenticationDatabase $MONGODB_AUTH_DATABASE \
  --gzip \
  --archive=$DOCKER_PATH/$FILENAME 2>&1

/usr/bin/rsync -avzh --info=progress2 \
  -e 'ssh -p23 -i /private-key -o StrictHostKeychecking=no' \
  $DOCKER_PATH/$FILENAME \
  $SFTP_SERVER:$SFTP_PATH/$FILENAME 2>&1
