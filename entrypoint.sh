#!/bin/sh

Wait for Postgres to be ready
echo "⏳ Waiting for PostgreSQL to be ready..."
until nc -z postgres 5432; do
  sleep 1
done

echo "✅ PostgreSQL is up. Running Prisma commands..."

npm run pull
echo "Pulling latest schema"

npm run generate
echo "Generating prisma client..."

npm run build
echo "Compiling package..."

if [ "$RUN_TESTS" = "true" ]; then
  npm run test
  echo "✅ Tests were run"
else
  echo "✅ Package compiled"
fi