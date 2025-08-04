# 🚂 Railway Deployment Guide

## Quick Deploy to Railway

### Step 1: Prepare Repository
Your repository is already configured for Railway deployment with:
- ✅ `runtime.txt` - Specifies Python 3.10.15
- ✅ `requirements.txt` - Lists all dependencies
- ✅ `railway.toml` - Railway-specific configuration
- ✅ Health check endpoint at `/health`

### Step 2: Deploy on Railway

1. **Go to Railway**: Visit [railway.app](https://railway.app)
2. **Sign up/Login**: Use your GitHub account
3. **New Project**: Click "New Project" → "Deploy from GitHub repo"
4. **Select Repository**: Choose `BloomBuddyBackend`
5. **Deploy**: Railway will automatically detect the configuration

### Step 3: Set Environment Variables

In your Railway project dashboard, go to **Variables** tab and add:

```
ANTHROPIC_API_KEY = your_anthropic_api_key_here
```

**Important**: Replace `your_anthropic_api_key_here` with your actual Anthropic API key from your account.

### Step 4: Monitor Deployment

1. Watch the **Deployments** tab for build progress
2. Check **Logs** for any issues
3. Once deployed, you'll get a URL like: `https://your-app.railway.app`

## Railway Configuration Details

### Automatic Detection
Railway automatically detects:
- Python version from `runtime.txt` (3.10.15)
- Dependencies from `requirements.txt`
- Start command from `railway.toml`

### Health Monitoring
- Health check endpoint: `/health`
- Timeout: 300 seconds
- Restart policy: ON_FAILURE

### Performance Settings
- Workers: 1 (optimal for free tier)
- Timeout: 120 seconds
- Logging: Enabled for both access and errors

## Testing Your Deployment

Once deployed, test these endpoints:

```bash
# Health check
curl https://your-app.railway.app/health

# Model information
curl https://your-app.railway.app/api/models/info

# Debug models
curl https://your-app.railway.app/debug/models
```

## Advantages of Railway over Render

1. ✅ **Respects runtime.txt** - No Python version conflicts
2. ✅ **Better dependency handling** - Fewer build failures
3. ✅ **Faster deployments** - More efficient build process
4. ✅ **Better free tier** - More generous resource limits
5. ✅ **Automatic HTTPS** - SSL certificates included
6. ✅ **Environment variables** - Easy to manage in dashboard

## Troubleshooting

If deployment fails:
1. Check the **Logs** tab in Railway dashboard
2. Verify environment variables are set correctly
3. Ensure all model files are committed to repository
4. Check that `/health` endpoint responds correctly

## Custom Domain (Optional)

Once deployed, you can add a custom domain:
1. Go to **Settings** → **Domains**
2. Add your custom domain
3. Update DNS records as instructed

Your ML API should deploy successfully on Railway! 🎉