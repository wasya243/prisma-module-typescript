#!/bin/sh

echo "✅ PostgreSQL is up - running Prisma commands..."

npm run generate

echo "✅ Prisma Client generated successfully!"