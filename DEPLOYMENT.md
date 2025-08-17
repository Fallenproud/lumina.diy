# Lumina.DIY Deployment Guide

## 🚀 Quick Start Options

### Option 1: Automatic GitHub Actions Deployment (Recommended)
1. **Set up Secrets** in your GitHub repository:
   ```
   CLOUDFLARE_API_TOKEN=your_cloudflare_api_token
   CLOUDFLARE_ACCOUNT_ID=your_account_id
   ```

2. **Push to main branch** - deployment happens automatically via GitHub Actions

3. **Access your site** at: `https://lumina-diy.pages.dev`

### Option 2: Manual Deployment Script
```bash
# Make script executable and run
chmod +x deploy.sh
./deploy.sh
```

### Option 3: Direct Commands
```bash
# Install pnpm globally (if not available)
npm install -g pnpm

# Install dependencies
pnpm install --frozen-lockfile

# Build the project
pnpm run build

# Deploy to Cloudflare Pages
wrangler pages deploy build --project-name=lumina-diy
```

## 🔧 Development Environment

### Local Development Setup
If you encounter dependency conflicts, try these solutions in order:

#### Solution 1: Clean Install
```bash
# Remove existing node_modules and lock files
rm -rf node_modules pnpm-lock.yaml package-lock.json

# Clear npm cache
npm cache clean --force

# Install with legacy peer deps
npm install --legacy-peer-deps
```

#### Solution 2: Use Different Node Version
```bash
# Using nvm (Node Version Manager)
nvm install 18.18.0
nvm use 18.18.0

# Try installation again
pnpm install
```

#### Solution 3: Skip Optional Dependencies
```bash
# Install without optional dependencies
npm install --legacy-peer-deps --no-optional
```

#### Solution 4: Docker Development
```bash
# Use the prebuilt Docker image
docker compose --profile prebuilt up

# Or build development image
docker compose --profile development up
```

### Common Issues & Fixes

#### Issue: "404 Error in File Explorer"
**Cause**: Missing node_modules or incomplete build
**Fix**: 
```bash
npm install --legacy-peer-deps
npm run build  # Required for Remix app
npm run start  # Start production server locally
```

#### Issue: "esbuild SIGSEGV error"
**Cause**: esbuild binary compatibility issue
**Fix**: 
```bash
npm install --legacy-peer-deps --ignore-scripts
npx esbuild --version  # Test esbuild separately
```

#### Issue: "wrangler version conflict"
**Cause**: @remix-run/dev expects wrangler v3, but project uses v4
**Fix**: 
```bash
# Temporarily downgrade wrangler
npm install wrangler@^3.28.2 --save-dev
```

## 🌐 Hosting Platforms

### Cloudflare Pages (Primary)
- **URL Format**: `https://lumina-diy.pages.dev`
- **Custom Domain**: Configure via Cloudflare Dashboard
- **Environment Variables**: Set via wrangler or dashboard

### Netlify (Backup)
- **Build Command**: `npm run build`
- **Publish Directory**: `build`
- **Node Version**: 20.x

### Vercel (Alternative)
- **Framework Preset**: Remix
- **Build Command**: `npm run build`
- **Output Directory**: `build`

## 🔐 Environment Variables

### Required for AI Features
```bash
OPENAI_API_KEY=your_openai_key
ANTHROPIC_API_KEY=your_anthropic_key
GOOGLE_GENERATIVE_AI_API_KEY=your_gemini_key
# ... other AI provider keys
```

### Optional Configuration
```bash
DEFAULT_NUM_CTX=32768
VITE_LOG_LEVEL=debug
NODE_ENV=production
```

## 📊 Build Output

### Expected Build Structure
```
build/
├── _worker.js          # Cloudflare Worker code
├── _routes.json        # Remix routing config
├── assets/            # Static assets
└── client/            # Client-side code
```

### Build Size Expectations
- **Total Build Size**: ~15-25 MB
- **Client Bundle**: ~2-5 MB
- **Worker Bundle**: ~1-3 MB

## 🚨 Troubleshooting

### Build Fails
1. Check Node.js version (18.18.0+ recommended)
2. Clear all caches and reinstall
3. Check for missing environment variables
4. Try building with `--verbose` flag

### Deployment Fails
1. Verify API tokens and permissions
2. Check project name availability
3. Ensure build directory exists and is valid
4. Check network connectivity and rate limits

### Runtime Issues
1. Check browser console for JavaScript errors
2. Verify API keys are properly configured
3. Check Cloudflare Worker logs
4. Monitor memory and CPU usage

## 📞 Support

If deployment issues persist:
1. Check the [GitHub Issues](https://github.com/Fallenproud/lumina.diy/issues)
2. Review Cloudflare Pages documentation
3. Join the community Discord for help
4. Create a detailed issue report with logs

---

**Last Updated**: 2024-08-17
**Version**: 1.0.0