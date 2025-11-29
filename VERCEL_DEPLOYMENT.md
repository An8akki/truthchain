# 🚀 Vercel Deployment Guide - TruthChain

## ✅ Quick Deploy to Vercel

Deploy your TruthChain application to Vercel in just a few clicks!

---

## 🎯 Option 1: Deploy via Vercel Dashboard (Recommended)

### Step 1: Go to Vercel

1. **Visit Vercel:**
   - Go to: https://vercel.com/
   
2. **Sign up / Log in:**
   - Use GitHub account (recommended)
   - Click "Continue with GitHub"
   - Authorize Vercel

### Step 2: Import Your Repository

1. **Click "Add New Project"**
   - Or go to: https://vercel.com/new

2. **Import Git Repository:**
   - Click "Import Git Repository"
   - Select "GitHub"
   - Find `An8akki/truthchain`
   - Click "Import"

### Step 3: Configure Project

**Framework Preset:**
- Vercel should auto-detect: **Next.js**

**Root Directory:**
- Set to: `frontend`
- Click "Edit" next to Root Directory
- Enter: `frontend`

**Build and Output Settings:**
- Build Command: `npm run build` (auto-detected)
- Output Directory: `.next` (auto-detected)
- Install Command: `npm install` (auto-detected)

**Environment Variables:**
- Skip for now (optional, can add later)

### Step 4: Deploy!

1. **Click "Deploy"**
   - Vercel will start building
   - Wait 2-3 minutes

2. **Deployment Complete!**
   - You'll see: "Congratulations!"
   - Your app is live!

3. **Get Your URL:**
   - Format: `https://truthchain-xxx.vercel.app`
   - Click "Visit" to see your live app

---

## 🎯 Option 2: Deploy via Vercel CLI

### Step 1: Install Vercel CLI

```bash
npm install -g vercel
```

### Step 2: Login to Vercel

```bash
vercel login
```

- Choose your login method (GitHub recommended)
- Authorize in browser

### Step 3: Deploy

```bash
# Navigate to project root
cd d:\BlockChain\TruthChain

# Deploy
vercel

# Follow prompts:
# - Set up and deploy? Yes
# - Which scope? Your account
# - Link to existing project? No
# - Project name? truthchain
# - Directory? ./frontend
# - Override settings? No
```

### Step 4: Production Deployment

```bash
# Deploy to production
vercel --prod
```

---

## 📋 Deployment Configuration

### vercel.json (Already Created)

```json
{
  "buildCommand": "cd frontend && npm install && npm run build",
  "outputDirectory": "frontend/.next",
  "devCommand": "cd frontend && npm run dev",
  "installCommand": "cd frontend && npm install",
  "framework": "nextjs",
  "regions": ["iad1"]
}
```

### Project Structure for Vercel

```
TruthChain/
├── frontend/              ← Root directory for Vercel
│   ├── app/
│   ├── components/
│   ├── contexts/
│   ├── lib/
│   ├── public/
│   ├── package.json
│   └── next.config.js
├── contracts/
├── scripts/
├── vercel.json           ← Vercel configuration
└── README.md
```

---

## 🔧 Environment Variables (Optional)

If you want to add environment variables on Vercel:

### Step 1: Go to Project Settings

1. Go to your Vercel dashboard
2. Select your project
3. Click "Settings"
4. Click "Environment Variables"

### Step 2: Add Variables

Add these if needed:

```
NEXT_PUBLIC_CREATOR_REGISTRY_ADDRESS=0x...
NEXT_PUBLIC_TRUTHCHAIN_ADDRESS=0x...
NEXT_PUBLIC_NETWORK_NAME=polygonAmoy
NEXT_PUBLIC_CHAIN_ID=80002
NEXT_PUBLIC_RPC_URL=https://rpc-amoy.polygon.technology
NEXT_PUBLIC_PINATA_API_KEY=your_key
NEXT_PUBLIC_PINATA_SECRET_KEY=your_secret
NEXT_PUBLIC_PINATA_JWT=your_jwt
```

**Note:** For demo mode, these are optional!

---

## 🎨 Custom Domain (Optional)

### Add Your Own Domain

1. **Go to Project Settings:**
   - Click "Domains"

2. **Add Domain:**
   - Enter your domain (e.g., `truthchain.com`)
   - Follow DNS configuration instructions

3. **Vercel Provides:**
   - Free SSL certificate
   - Automatic HTTPS
   - Global CDN

---

## 🚀 Deployment Process

### What Happens When You Deploy:

1. **Vercel Clones Your Repo**
   - From GitHub: `An8akki/truthchain`

2. **Installs Dependencies**
   - Runs: `npm install` in `frontend/`

3. **Builds Your App**
   - Runs: `npm run build`
   - Creates optimized production build

4. **Deploys to CDN**
   - Distributes globally
   - Enables edge caching

5. **Provides URL**
   - Format: `https://truthchain-xxx.vercel.app`
   - Or your custom domain

---

## 📊 Expected Build Output

```
Building...
✓ Compiled successfully
✓ Linting and checking validity of types
✓ Collecting page data
✓ Generating static pages (5/5)
✓ Finalizing page optimization

Route (app)                              Size     First Load JS
┌ ○ /                                    5.2 kB         95 kB
├ ○ /admin                               8.1 kB         98 kB
├ ○ /creator                             12.3 kB        102 kB
├ ○ /explore                             7.8 kB         97 kB
└ ○ /verify                              9.5 kB         99 kB

○  (Static)  prerendered as static content

✓ Build completed successfully
```

---

## ✅ Verify Deployment

### After Deployment:

1. **Visit Your URL:**
   ```
   https://truthchain-xxx.vercel.app
   ```

2. **Test All Pages:**
   - Home: `/`
   - Verify: `/verify`
   - Creator: `/creator`
   - Explore: `/explore`
   - Admin: `/admin`

3. **Check Features:**
   - ✅ Cosmos background loads
   - ✅ Navigation works
   - ✅ Creator registration works
   - ✅ Content upload works
   - ✅ Verification works
   - ✅ All features functional

---

## 🔄 Automatic Deployments

### How It Works:

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Update feature"
   git push
   ```

2. **Vercel Auto-Deploys:**
   - Detects push to `master` branch
   - Automatically builds and deploys
   - Updates live site in 2-3 minutes

3. **Preview Deployments:**
   - Every branch gets a preview URL
   - Test before merging to master

---

## 🎯 Deployment Checklist

### Before Deploying:

- [x] Code pushed to GitHub
- [x] `vercel.json` created
- [x] Frontend builds locally (`npm run build`)
- [x] No build errors
- [x] All features tested

### During Deployment:

- [ ] Vercel project created
- [ ] Root directory set to `frontend`
- [ ] Build completes successfully
- [ ] Deployment URL received

### After Deployment:

- [ ] Visit deployment URL
- [ ] Test all pages
- [ ] Verify features work
- [ ] Check console for errors
- [ ] Share with users!

---

## 🐛 Troubleshooting

### Build Fails

**Error:** "Build failed"

**Solution:**
1. Check build logs in Vercel dashboard
2. Test build locally:
   ```bash
   cd frontend
   npm run build
   ```
3. Fix any errors
4. Push to GitHub
5. Vercel will auto-redeploy

---

### 404 on Routes

**Error:** "404 Not Found" on `/creator`, `/verify`, etc.

**Solution:**
- Ensure root directory is set to `frontend`
- Next.js should handle routing automatically
- Check `next.config.js` if exists

---

### Environment Variables Not Working

**Error:** "undefined" for environment variables

**Solution:**
1. Add variables in Vercel dashboard
2. Redeploy after adding variables
3. Ensure variables start with `NEXT_PUBLIC_`

---

### Slow Loading

**Issue:** App loads slowly

**Solution:**
- Vercel uses global CDN (should be fast)
- Check image optimization
- Enable caching headers
- Use Vercel Analytics to diagnose

---

## 📈 Vercel Features You Get

### Free Tier Includes:

- ✅ **Unlimited Deployments**
- ✅ **Automatic HTTPS**
- ✅ **Global CDN**
- ✅ **Preview Deployments**
- ✅ **Auto-scaling**
- ✅ **100GB Bandwidth/month**
- ✅ **Serverless Functions**
- ✅ **Analytics** (optional)

### Performance:

- ⚡ **Edge Network:** 70+ locations worldwide
- ⚡ **Fast Builds:** 2-3 minutes average
- ⚡ **Instant Rollbacks:** One-click revert
- ⚡ **Zero Downtime:** Atomic deployments

---

## 🔗 Useful Links

### Vercel Dashboard:
- **Projects:** https://vercel.com/dashboard
- **Deployments:** https://vercel.com/deployments
- **Settings:** https://vercel.com/account

### Documentation:
- **Vercel Docs:** https://vercel.com/docs
- **Next.js on Vercel:** https://vercel.com/docs/frameworks/nextjs
- **CLI Reference:** https://vercel.com/docs/cli

---

## 🎉 One-Click Deploy Button

Add this to your README.md:

```markdown
[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/An8akki/truthchain&project-name=truthchain&repository-name=truthchain&root-directory=frontend)
```

This creates a button that deploys your app with one click!

---

## 📊 Deployment Summary

### What You Get:

```
🌐 Live URL:          https://truthchain-xxx.vercel.app
🚀 Deploy Time:       2-3 minutes
🔄 Auto-Deploy:       On every push to master
🌍 Global CDN:        70+ edge locations
📊 Analytics:         Built-in (optional)
🔒 HTTPS:             Automatic SSL
💰 Cost:              FREE (Hobby plan)
```

---

## ✅ Quick Deploy Steps

### TL;DR - Just Do This:

1. **Go to:** https://vercel.com/new
2. **Import:** `An8akki/truthchain`
3. **Set Root Directory:** `frontend`
4. **Click:** "Deploy"
5. **Wait:** 2-3 minutes
6. **Done!** Visit your live URL

---

## 🎯 Next Steps After Deployment

1. **Share Your URL:**
   - Post on social media
   - Share with friends
   - Add to portfolio

2. **Monitor Performance:**
   - Check Vercel Analytics
   - Monitor build times
   - Track visitor stats

3. **Keep Updating:**
   - Push to GitHub
   - Vercel auto-deploys
   - Always stay current

4. **Add Custom Domain:**
   - Buy a domain
   - Point DNS to Vercel
   - Get professional URL

---

## 🆘 Need Help?

- **Vercel Support:** https://vercel.com/support
- **Vercel Community:** https://github.com/vercel/vercel/discussions
- **Next.js Docs:** https://nextjs.org/docs

---

**🎉 Your TruthChain app is ready to deploy to Vercel!** 🚀

**Deploy Now:** https://vercel.com/new

---

*Last Updated: 2025-11-29*  
*For TruthChain v1.0*
