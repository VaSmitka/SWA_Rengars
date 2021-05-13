#!/bin/bash
set -e

mongo <<EOF
use admin
db = db.getSiblingDB('$MARKETPLACE_DATABASE_NAME');
db.createUser(
  {
    user: '$DB_MARKETPLACE_USERNAME',
    pwd: '$DB_MARKETPLACE_PASSWORD',
    roles: [{ role: 'readWrite', db: '$MARKETPLACE_DATABASE_NAME' }],
  },
);
db.createCollection('users');
db = db.getSiblingDB('$NOTIFICATION_DATABASE_NAME');
db.createUser(
  {
    user: '$DB_NOTIFICATION_USERNAME',
    pwd: '$DB_NOTIFICATION_PASSWORD',
    roles: [{ role: 'readWrite', db: '$NOTIFICATION_DATABASE_NAME' }],
  },
);
db.createCollection('users');
EOF