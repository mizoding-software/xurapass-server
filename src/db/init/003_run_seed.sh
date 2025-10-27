#!/bin/bash
set -e

echo "=== Starting Data Seeding ==="

until psql -U $POSTGRES_USER -d $POSTGRES_DB -c "SELECT 1 FROM users LIMIT 1;" &>/dev/null; do
    echo "Waiting for schema to be ready..."
    sleep 2
done

echo "Schema is ready - executing seed files..."

for file in /docker-entrypoint-initdb.d/seed/*.sql; do
    echo "Executing: $(basename $file)"
    psql -U $POSTGRES_USER -d $POSTGRES_DB -f "$file"
done

echo "=== Data seeding completed ==="