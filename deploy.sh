#!/bin/bash

# Lumina.DIY Deployment Script
echo "🚀 Starting Lumina.DIY deployment..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Please run this script from the project root."
    exit 1
fi

# Set environment to production
export NODE_ENV=production

# Install pnpm if not available
if ! command -v pnpm &> /dev/null; then
    echo "📦 Installing pnpm..."
    npm install -g pnpm
fi

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install --frozen-lockfile || {
    echo "⚠️  pnpm install failed, trying with legacy peer deps..."
    npm install --legacy-peer-deps --production
}

# Build the project
echo "🔨 Building project..."
pnpm run build || npm run build

# Check if build directory exists
if [ -d "build" ]; then
    echo "✅ Build completed successfully!"
    echo "📁 Build directory size: $(du -sh build | cut -f1)"
    
    # Deploy to Cloudflare Pages (if wrangler is available)
    if command -v wrangler &> /dev/null; then
        echo "☁️  Deploying to Cloudflare Pages..."
        wrangler pages deploy build --project-name=lumina-diy
    else
        echo "⚠️  Wrangler not found. Build completed but not deployed."
        echo "💡 You can manually deploy the 'build' directory to your preferred hosting platform."
    fi
else
    echo "❌ Build failed - no build directory found"
    exit 1
fi

echo "🎉 Deployment script completed!"