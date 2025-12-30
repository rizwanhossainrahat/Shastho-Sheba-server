set -o errexit

# Install dependencies
npm install

# Build the application
npm run build

# Generate Prisma client
npx prisma generate

# Run database migrations
npx prisma migrate deploy