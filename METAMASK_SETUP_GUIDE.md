# 🦊 MetaMask Setup Guide for TruthChain

## ✅ Changes Made

I've updated the Web3 connection code to provide better error handling and user feedback when connecting to MetaMask.

### What's New:
- ✅ Better error messages with user-friendly alerts
- ✅ MetaMask installation check
- ✅ Success confirmation when connected
- ✅ TypeScript type definitions for window.ethereum
- ✅ Helpful tips for demo mode usage

---

## 🦊 Option 1: Install MetaMask (Recommended)

### Step 1: Install MetaMask Extension

1. **Go to MetaMask website:**
   - Visit: https://metamask.io/
   
2. **Click "Download"**
   - Choose your browser (Chrome, Firefox, Brave, Edge)
   
3. **Install the extension**
   - Click "Add to Chrome" (or your browser)
   - Click "Add Extension"
   
4. **Set up your wallet**
   - Click "Get Started"
   - Choose "Create a new wallet"
   - Create a password
   - **IMPORTANT:** Save your Secret Recovery Phrase securely!

### Step 2: Connect to TruthChain

1. **Refresh your browser**
   - Go to `http://localhost:3000`
   
2. **Click "Connect Wallet"**
   - The green button in the top right
   
3. **Approve in MetaMask**
   - MetaMask popup will appear
   - Click "Next"
   - Click "Connect"
   
4. **Success!**
   - You'll see your wallet address in the navigation
   - Format: `0x1234...5678`

---

## 🎯 Option 2: Use Demo Mode (No MetaMask)

You can use TruthChain without MetaMask! Just navigate directly to the pages:

### Direct Page Access:

1. **Creator Portal:**
   ```
   http://localhost:3000/creator
   ```
   - Register with username/password
   - No wallet needed!

2. **Admin Panel:**
   ```
   http://localhost:3000/admin
   ```
   - Approve creators
   - Manage content
   - No wallet needed!

3. **Explore Page:**
   ```
   http://localhost:3000/explore
   ```
   - Browse all content
   - Search and filter
   - No wallet needed!

4. **Verify Page:**
   ```
   http://localhost:3000/verify
   ```
   - Verify content by hash, text, file, or creator
   - No wallet needed!

---

## 🔧 Troubleshooting

### Error: "MetaMask is not installed"

**Solution:**
1. Install MetaMask from https://metamask.io/
2. Refresh the page
3. Click "Connect Wallet" again

**OR** use demo mode (see Option 2 above)

---

### Error: "Connection rejected"

**Cause:** You clicked "Reject" in the MetaMask popup

**Solution:**
1. Click "Connect Wallet" again
2. This time, click "Connect" in MetaMask popup

---

### Error: "Connection request already pending"

**Cause:** MetaMask popup is already open

**Solution:**
1. Look for the MetaMask icon in your browser toolbar
2. Click it to open the pending request
3. Approve or reject the connection

---

### MetaMask is installed but not connecting

**Solution:**
1. **Check if MetaMask is unlocked:**
   - Click the MetaMask icon
   - Enter your password if locked

2. **Check browser console:**
   - Press F12
   - Look for error messages
   - Share them if you need help

3. **Try refreshing:**
   - Refresh the page
   - Try connecting again

---

## 🎓 Understanding the Connection

### What Happens When You Connect:

1. **TruthChain requests access** to your MetaMask wallet
2. **MetaMask shows a popup** asking for permission
3. **You approve** the connection
4. **TruthChain receives** your wallet address
5. **Your address is displayed** in the navigation bar

### What TruthChain Can Do:

✅ **Can:**
- Read your wallet address
- Request you to sign transactions
- Display your address in the UI

❌ **Cannot:**
- Access your funds without permission
- Make transactions without your approval
- See your private keys

---

## 🌐 Network Configuration

### Default Network: Polygon Amoy Testnet

TruthChain is configured to use **Polygon Amoy Testnet** for testing.

**Network Details:**
- Chain ID: 80002 (0x13882)
- RPC URL: https://rpc-amoy.polygon.technology
- Currency: MATIC (testnet)
- Explorer: https://amoy.polygonscan.com/

### How to Add Polygon Amoy to MetaMask:

1. **Connect your wallet** to TruthChain
2. **MetaMask will prompt** to add the network
3. **Click "Approve"** to add Polygon Amoy
4. **Switch to the network** if not automatic

**OR manually add:**

1. Open MetaMask
2. Click the network dropdown (top center)
3. Click "Add Network"
4. Click "Add a network manually"
5. Enter:
   - Network Name: `Polygon Amoy Testnet`
   - RPC URL: `https://rpc-amoy.polygon.technology`
   - Chain ID: `80002`
   - Currency Symbol: `MATIC`
   - Block Explorer: `https://amoy.polygonscan.com/`
6. Click "Save"

---

## 💰 Getting Testnet MATIC

To use TruthChain on the blockchain, you'll need testnet MATIC (it's free!):

### Step 1: Get Your Wallet Address
1. Connect MetaMask to TruthChain
2. Copy your address (click the address to copy)

### Step 2: Visit Polygon Faucet
1. Go to: https://faucet.polygon.technology/
2. Select "Polygon Amoy"
3. Paste your wallet address
4. Click "Submit"
5. Wait 1-2 minutes

### Step 3: Verify
1. Check MetaMask
2. You should see testnet MATIC balance

---

## 🚀 Using MetaMask with TruthChain

### Once Connected:

1. **Your address is displayed** in the navigation
   - Format: `0x1234...5678`
   - Green dot indicates connected

2. **You can disconnect** anytime
   - Click the logout icon next to your address

3. **Creator Portal** will use your wallet address
   - Register as a creator
   - Your wallet address is your identity

4. **Content Upload** will be linked to your wallet
   - All content you upload is associated with your address

---

## 📊 Connection Status

### How to Check if Connected:

**Visual Indicators:**
- ✅ Green "Connect Wallet" button → Not connected
- ✅ Your address displayed → Connected
- ✅ Green dot next to address → Active connection

**In Console (F12):**
```javascript
// Check if MetaMask is installed
console.log('MetaMask installed:', typeof window.ethereum !== 'undefined');

// Check current account
window.ethereum?.request({ method: 'eth_accounts' })
  .then(accounts => console.log('Connected accounts:', accounts));
```

---

## 🎯 Quick Test

### Test MetaMask Connection:

1. **Open TruthChain:**
   ```
   http://localhost:3000
   ```

2. **Click "Connect Wallet"**

3. **You should see:**
   - MetaMask popup appears
   - OR alert saying "MetaMask is not installed"

4. **If MetaMask popup appears:**
   - Click "Connect"
   - See success alert
   - See your address in navigation

5. **If alert appears:**
   - Follow installation steps above
   - OR use demo mode

---

## 🔐 Security Tips

### Keep Your Wallet Safe:

1. **Never share your Secret Recovery Phrase**
   - MetaMask will NEVER ask for it
   - TruthChain will NEVER ask for it
   - Anyone with it can steal your funds

2. **Always verify the website**
   - Make sure you're on `localhost:3000` (development)
   - Check the URL before connecting

3. **Review transactions before signing**
   - MetaMask will show transaction details
   - Read them carefully before approving

4. **Use testnet for testing**
   - Polygon Amoy is a testnet
   - Testnet MATIC has no real value
   - Perfect for learning and testing

---

## 📝 Summary

### With MetaMask:
- ✅ Full blockchain integration
- ✅ Real wallet addresses
- ✅ Transaction signing
- ✅ Decentralized identity
- ✅ Production-ready features

### Without MetaMask (Demo Mode):
- ✅ All features work
- ✅ LocalStorage instead of blockchain
- ✅ Username/password auth
- ✅ Perfect for testing
- ✅ No installation needed

---

## 🆘 Still Having Issues?

### Check These:

1. **Is MetaMask installed?**
   - Look for the fox icon in your browser toolbar
   - If not, install from https://metamask.io/

2. **Is MetaMask unlocked?**
   - Click the MetaMask icon
   - Enter your password if needed

3. **Is the popup blocked?**
   - Check your browser's popup blocker
   - Allow popups for localhost

4. **Browser console errors?**
   - Press F12
   - Check the Console tab
   - Look for red error messages

5. **Try incognito mode:**
   - Open an incognito/private window
   - Install MetaMask there
   - Try connecting

---

## 📞 Need More Help?

- **MetaMask Support:** https://support.metamask.io/
- **Polygon Docs:** https://docs.polygon.technology/
- **TruthChain Docs:** See TROUBLESHOOTING.md

---

**🎉 You're all set! Connect MetaMask and start using TruthChain!** 🦊

---

*Last Updated: 2025-11-29*  
*For TruthChain v1.0*
