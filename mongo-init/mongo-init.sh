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
db.createCollection('configurations', { capped: false });
db.configurations.insert({
  'type':'TEST_MAIL_NOTIFICATION',
  'notificatorName':'MailNotificator',
  'notificatorParameters':{
    'from':'$FROM_MAIL_ADDRESS',
    'subject': 'Hello there'
  },
  'template':'Dear \${name}, hi. Thanks, bye :)'
});

db.configurations.insert({
  'type':'JOB_OFFER_CREATED',
  'notificatorName':'MailNotificator',
  'notificatorParameters':{
    'from':'$FROM_MAIL_ADDRESS',
    'subject': 'New marketplace offer!'
  },
  'template':'There is a new marketplace offer from company \${companyName}: \n\${description}.'
});

db.configurations.insert({
  'type':'NEW_USER_ACCOUNT_CREATED',
  'notificatorName':'MailNotificator',
  'notificatorParameters':{
    'from':'$FROM_MAIL_ADDRESS',
    'subject': 'Welcome'
  },
  'template':'Dear \${name}, thank you for your registration. Bye :)'
});

db.configurations.insert({
  'type':'NEW_USER_ACCOUNT_CREATED',
  'notificatorName':'ConsoleNotificator',
  'notificatorParameters':{
    'prefix':'users: '
  },
  'template':'Dear \${name}, thank you for your registration. Bye 🙂'
});

db.configurations.insert({
  'type':'JOB_OFFER_CREATED',
  'notificatorName':'ConsoleNotificator',
  'notificatorParameters':{
    'prefix':'marketplace: '
  },
  'template':'There is a new marketplace offer from company \${companyName}: \n\${description}.'
});
EOF