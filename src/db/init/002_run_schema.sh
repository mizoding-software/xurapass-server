#!/bin/bash
set -e

echo "=== Starting Database Initialization ==="

until pg_isready -U $POSTGRES_USER -d $POSTGRES_DB; do
    echo "Waiting for PostgreSQL to be ready..."
    sleep 2
done

echo "PostgreSQL is ready - executing schema files..."

for file in /docker-entrypoint-initdb.d/schema/*.sql; do
    echo "Executing: $(basename $file)"
    psql -U $POSTGRES_USER -d $POSTGRES_DB -f "$file"
done

echo "=== Schema creation completed ==="