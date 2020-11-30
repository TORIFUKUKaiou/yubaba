#!/bin/bash
# assign a default for the database_user
DB_USER=postgres

# wait until Postgres is ready
while ! pg_isready -q -h $DATABASE_HOST -p 5432 -U $DB_USER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

bin="/app/bin/yubaba"

eval "$bin eval \"Yubaba.Release.migrate\""
exec "$bin" "start"