#!/bin/bash
set -o errexit

echo "🚀 Starting build process..."

# Install all dependencies (including dev dependencies for build)
echo "📦 Installing dependencies..."
npm ci

# Generate Prisma client first
echo "🔧 Generating Prisma client..."
npx prisma generate --schema=./prisma/schema/schema.prisma

# Build TypeScript
echo "🏗️ Building TypeScript..."
npm run build

# Run database migrations
echo "🗄️ Running database migrations..."
npx prisma migrate deploy --schema=./prisma/schema/schema.prisma

echo "✅ Build completed successfully!"