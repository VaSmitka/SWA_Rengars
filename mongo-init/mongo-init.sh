#!/bin/bash
set -e

mongo <<EOF
use $MARKETPLACE_DATABASE_NAME
db.createUser({
    user: '$DB_MARKETPLACE_USERNAME',
    pwd: '$DB_MARKETPLACE_PASSWORD',
    roles: [{ role: 'readWrite', db: '$MARKETPLACE_DATABASE_NAME' }],
});
EOF

mongo <<EOF
use $NOTIFICATION_DATABASE_NAME
db.createUser({
    user: '$DB_NOTIFICATION_USERNAME',
    pwd: '$DB_NOTIFICATION_PASSWORD',
    roles: [{ role: 'readWrite', db: '$NOTIFICATION_DATABASE_NAME' }],
});
EOF