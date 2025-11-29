# 🚨 MetaMask Connection Error - Quick Fix Guide

## ❌ Error You're Seeing

```
Failed to connect to MetaMask
Call Stack
Object.connect
chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn/scripts/inpage.js
```

---

## ✅ **Solution: Use Demo Mode (No MetaMask Required!)**

TruthChain works in **demo mode** using LocalStorage. You don't need MetaMask for most features!

---

## 🎯 How to Use TruthChain Without MetaMask

### Option 1: Skip Wallet Connection (Recommended)

**Just ignore the "Connect Wallet" button and go directly to the pages:**

1. **Creator Portal:** `http://localhost:3000/creator`
   - Register and login work without wallet
   - Uses username/password authentication

2. **Admin Panel:** `http://localhost:3000/admin`
   - Works completely without wallet
   - Manage creators and content

3. **Explore Page:** `http://localhost:3000/explore`
   - Browse all content without wallet
   - Search and filter work

4. **Verify Page:** `http://localhost:3000/verify`
   - Verify content without wallet
   - All 4 methods work (Hash, Text, File, Creator)

---

## 🔧 Option 2: Install MetaMask (If You Want Full Experience)

### Step 1: Install MetaMask
1. Go to [metamask.io](https://metamask.io/)
2. Click "Download"
3. Install the browser extension
4. Create a new wallet or import existing

### Step 2: Connect to Application
1. Refresh `http://localhost:3000`
2. Click "Connect Wallet"
3. Approve in MetaMask popup
4. You're connected!

---

## 🎓 Demo Mode Features (No Wallet Needed)

### ✅ Works Without MetaMask:
- ✅ Creator registration (username/password)
- ✅ Creator login/logout
- ✅ Admin approval workflow
- ✅ Content upload (after admin approval)
- ✅ Content verification (all 4 methods)
- ✅ Content exploration
- ✅ Search and filter
- ✅ Version history
- ✅ Tamper detection
- ✅ Analytics dashboard
- ✅ Inbox system
- ✅ Admin moderation

### ⚠️ Requires MetaMask (Future Blockchain Mode):
- Blockchain transaction signing
- On-chain content storage
- IPFS integration
- Real wallet addresses

---

## 🚀 Quick Start (No MetaMask)

### 1. Register as Creator
```
1. Go to http://localhost:3000/creator
2. Fill registration form:
   - Name: "Test User"
   - Organization: "Test Org"
   - Password: "test123"
3. Click "Register"
4. See "Awaiting Verification" message
```

### 2. Admin Approve
```
1. Go to http://localhost:3000/admin
2. Click "Approve" on "Test User"
3. Copy the security key shown
```

### 3. Upload Content
```
1. Back to http://localhost:3000/creator
2. Click "Already registered? Login"
3. Login with username "Test User" and password "test123"
4. Go to Inbox, see security key
5. Go to Upload tab, paste key, click "Unlock"
6. Fill upload form and publish
```

### 4. Verify Content
```
1. Copy hash from "My Content"
2. Go to http://localhost:3000/verify
3. Paste hash, click "Verify Content"
4. See "Authentic" result
```

---

## 🐛 Troubleshooting

### Error: "Failed to connect to MetaMask"
**Solution:** Just ignore it! Use the app without connecting wallet.

### Error: "MetaMask not installed"
**Solution:** Either install MetaMask OR use demo mode (no wallet needed).

### Page shows "Connect Wallet" screen
**Solution:** Navigate directly to the page URL:
- Creator: `/creator`
- Admin: `/admin`
- Explore: `/explore`
- Verify: `/verify`

### Can't upload content
**Solution:** Make sure you:
1. Registered as creator
2. Got approved by admin
3. Received security key in inbox
4. Unlocked upload feature with key

---

## 📝 Understanding Demo Mode vs Blockchain Mode

### Current: Demo Mode (LocalStorage)
- ✅ All features work
- ✅ No MetaMask required
- ✅ Data stored in browser
- ✅ Perfect for testing
- ⚠️ Data clears when you clear browser cache

### Future: Blockchain Mode (Polygon)
- Requires MetaMask
- Data stored on blockchain
- Permanent and immutable
- Requires gas fees (testnet is free)
- Requires deployment of smart contracts

---

## 🎯 Recommended Testing Flow (No MetaMask)

### Complete Test (10 minutes)

**1. Creator Registration (2 min)**
```
http://localhost:3000/creator
→ Register → See pending status
```

**2. Admin Approval (1 min)**
```
http://localhost:3000/admin
→ Approve creator → Get security key
```

**3. Content Upload (2 min)**
```
http://localhost:3000/creator
→ Login → Unlock → Upload content
```

**4. Content Verification (2 min)**
```
http://localhost:3000/verify
→ Paste hash → Verify → See "Authentic"
```

**5. Content Exploration (2 min)**
```
http://localhost:3000/explore
→ Search → Filter → View details
```

**6. Admin Moderation (1 min)**
```
http://localhost:3000/admin
→ Block content → Check explore (hidden)
→ Unblock → Check explore (visible)
```

---

## ✅ Summary

**You DON'T need MetaMask to use TruthChain!**

- ✅ Demo mode works perfectly without wallet
- ✅ All features are functional
- ✅ Just navigate directly to pages
- ✅ Use username/password for creators
- ✅ Admin panel works without wallet

**Only install MetaMask if:**
- You want to test blockchain integration
- You're deploying to production
- You want real wallet addresses

---

## 🚀 Next Steps

1. **Ignore the MetaMask error**
2. **Go to:** `http://localhost:3000/creator`
3. **Follow:** QUICK_TEST_GUIDE.md or VISUAL_TEST_CHECKLIST.md
4. **Test:** All features work without wallet!

---

## 📞 Still Having Issues?

Check these documents:
- **TROUBLESHOOTING.md** - Common issues
- **QUICK_TEST_GUIDE.md** - Testing guide
- **VISUAL_TEST_CHECKLIST.md** - Step-by-step testing

---

**TruthChain works great in demo mode - no MetaMask required!** 🎉

Just navigate to the pages directly and start testing!
