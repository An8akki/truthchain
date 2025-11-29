# 🚀 TruthChain Deployment Guide

This guide will walk you through deploying TruthChain from scratch.

## Prerequisites Checklist

- [ ] Node.js v18+ installed
- [ ] MetaMask wallet installed
- [ ] Polygon testnet MATIC (from faucet)
- [ ] Pinata account created
- [ ] Code editor (VS Code recommended)

## Step-by-Step Deployment

### Phase 1: Environment Setup (10 minutes)

#### 1.1 Get Polygon Testnet MATIC

1. Visit https://faucet.polygon.technology/
2. Select "Polygon Amoy Testnet"
3. Connect your MetaMask wallet
4. Request testnet MATIC
5. Wait for confirmation

#### 1.2 Get Pinata API Keys

1. Visit https://app.pinata.cloud/
2. Sign up for a free account
3. Go to "API Keys" section
4. Click "New Key"
5. Enable "pinFileToIPFS" and "pinJSONToIPFS"
6. Copy your API Key, Secret Key, and JWT

#### 1.3 Get RPC URL (Optional - Free tier available)

**Option A: Use Public RPC (Free)**
```
https://rpc-amoy.polygon.technology
```

**Option B: Get Dedicated RPC (Recommended for production)**
1. Visit https://www.alchemy.com/ or https://infura.io/
2. Create a free account
3. Create a new app for "Polygon Amoy"
4. Copy your RPC URL

### Phase 2: Configure Environment (5 minutes)

#### 2.1 Root Directory Configuration

Create `.env` in the root directory:

```bash
# Blockchain Configuration
POLYGON_AMOY_RPC_URL=https://rpc-amoy.polygon.technology
PRIVATE_KEY=your_metamask_private_key_here
POLYGONSCAN_API_KEY=your_polygonscan_api_key_here
```

**How to get your MetaMask private key:**
1. Open MetaMask
2. Click the three dots menu
3. Account Details > Show Private Key
4. Enter your password
5. Copy the private key
⚠️ **NEVER share this with anyone!**

**How to get Polygonscan API key:**
1. Visit https://polygonscan.com/
2. Sign up for an account
3. Go to "API-KEYs" section
4. Create a new API key
5. Copy the key

#### 2.2 Frontend Configuration

Create `frontend/.env.local`:

```bash
# These will be filled after contract deployment
NEXT_PUBLIC_CREATOR_REGISTRY_ADDRESS=
NEXT_PUBLIC_TRUTHCHAIN_ADDRESS=

# Network Configuration
NEXT_PUBLIC_NETWORK_NAME=polygonAmoy
NEXT_PUBLIC_CHAIN_ID=80002
NEXT_PUBLIC_RPC_URL=https://rpc-amoy.polygon.technology

# Pinata Configuration
NEXT_PUBLIC_PINATA_API_KEY=your_pinata_api_key
NEXT_PUBLIC_PINATA_SECRET_KEY=your_pinata_secret_key
NEXT_PUBLIC_PINATA_JWT=your_pinata_jwt
```

### Phase 3: Install Dependencies (5 minutes)

```bash
# Install root dependencies
npm install

# Install frontend dependencies
cd frontend
npm install
cd ..
```

### Phase 4: Deploy Smart Contracts (5 minutes)

#### 4.1 Compile Contracts

```bash
npx hardhat compile
```

Expected output:
```
Compiled 2 Solidity files successfully
```

#### 4.2 Deploy to Polygon Amoy

```bash
npx hardhat run scripts/deploy.js --network polygonAmoy
```

Expected output:
```
🚀 Starting TruthChain deployment...
📝 Deploying contracts with account: 0x...
💰 Account balance: 0.5 ETH

📋 Deploying CreatorRegistry...
✅ CreatorRegistry deployed to: 0x...

📋 Deploying TruthChain...
✅ TruthChain deployed to: 0x...

📄 Deployment info saved to: deployments/polygonAmoy.json
✅ ABIs copied to frontend

🎉 Deployment completed successfully!
```

#### 4.3 Update Frontend Environment

Open `deployments/polygonAmoy.json` and copy the contract addresses.

Update `frontend/.env.local`:
```bash
NEXT_PUBLIC_CREATOR_REGISTRY_ADDRESS=0x... # From deployment
NEXT_PUBLIC_TRUTHCHAIN_ADDRESS=0x...       # From deployment
```

### Phase 5: Run the Application (2 minutes)

#### 5.1 Start the Frontend

```bash
cd frontend
npm run dev
```

Expected output:
```
✓ Ready in 2s
- Local:        http://localhost:3000
```

#### 5.2 Test the Application

1. Open http://localhost:3000 in your browser
2. Click "Connect Wallet"
3. Approve MetaMask connection
4. Switch to Polygon Amoy network if prompted

### Phase 6: Verify Deployment (5 minutes)

#### 6.1 Test Creator Registration

1. Go to "Creator Portal"
2. Fill in your name and organization
3. Click "Register on Blockchain"
4. Approve the transaction in MetaMask
5. Wait for confirmation

#### 6.2 Verify Creator (Admin Only)

Since you deployed the contracts, you're the owner. You can verify creators:

```bash
# Create a script to verify creators
npx hardhat console --network polygonAmoy
```

Then in the console:
```javascript
const CreatorRegistry = await ethers.getContractFactory("CreatorRegistry");
const registry = await CreatorRegistry.attach("YOUR_REGISTRY_ADDRESS");
await registry.verifyCreator("CREATOR_ADDRESS");
```

#### 6.3 Test Content Upload

1. Once verified, go to "Upload Content" tab
2. Fill in content details
3. Click "Publish to Blockchain"
4. Approve the transaction
5. Wait for confirmation

#### 6.4 Test Content Verification

1. Go to "Verify Content"
2. Paste the content you uploaded
3. Click "Verify Content"
4. Should show "Content Verified ✓"

## Production Deployment

### Deploy to Polygon Mainnet

1. **Get Mainnet MATIC**
   - Buy MATIC from an exchange
   - Send to your deployment wallet

2. **Update Configuration**
   ```bash
   # .env
   POLYGON_RPC_URL=https://polygon-rpc.com
   ```

3. **Deploy**
   ```bash
   npx hardhat run scripts/deploy.js --network polygon
   ```

4. **Verify Contracts**
   ```bash
   npx hardhat verify --network polygon <CONTRACT_ADDRESS>
   ```

### Deploy Frontend to Vercel

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

2. **Deploy to Vercel**
   - Visit https://vercel.com/
   - Click "Import Project"
   - Select your GitHub repository
   - Add environment variables from `.env.local`
   - Click "Deploy"

3. **Configure Domain** (Optional)
   - Add custom domain in Vercel settings

## Troubleshooting

### Common Issues

**Issue: "Insufficient funds for gas"**
- Solution: Get more testnet MATIC from the faucet

**Issue: "Network not supported"**
- Solution: Add Polygon Amoy network to MetaMask manually:
  - Network Name: Polygon Amoy
  - RPC URL: https://rpc-amoy.polygon.technology
  - Chain ID: 80002
  - Currency Symbol: MATIC
  - Block Explorer: https://amoy.polygonscan.com/

**Issue: "Contract not deployed"**
- Solution: Check that deployment was successful and addresses are correct in `.env.local`

**Issue: "IPFS upload failed"**
- Solution: Verify Pinata API keys are correct

**Issue: "Transaction failed"**
- Solution: Check you have enough MATIC for gas fees

## Cost Estimation

### Testnet (FREE)
- Gas fees: FREE (testnet MATIC from faucet)
- IPFS storage: FREE (Pinata free tier: 1GB)
- Frontend hosting: FREE (Vercel free tier)

### Mainnet
- Contract deployment: ~$5-10 (one-time)
- Creator registration: ~$0.01-0.05 per registration
- Content upload: ~$0.01-0.05 per upload
- Content verification: ~$0.01 per verification
- IPFS storage: FREE up to 1GB (Pinata)
- Frontend hosting: FREE (Vercel)

## Next Steps

1. ✅ Deploy to testnet
2. ✅ Test all features
3. ✅ Get feedback from users
4. ✅ Audit smart contracts
5. ✅ Deploy to mainnet
6. ✅ Launch publicly

## Support

If you encounter any issues:
1. Check the troubleshooting section
2. Review the logs for error messages
3. Open an issue on GitHub
4. Contact the development team

---

**Congratulations! 🎉**

You've successfully deployed TruthChain!
