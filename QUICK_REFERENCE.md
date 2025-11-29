# 🚀 TruthChain Quick Reference

## Common Commands

### Development

```bash
# Start frontend development server
cd frontend && npm run dev

# Compile smart contracts
npx hardhat compile

# Run tests
npx hardhat test

# Deploy to local network
npx hardhat run scripts/deploy.js --network hardhat
```

### Deployment

```bash
# Deploy to Polygon Amoy Testnet
npx hardhat run scripts/deploy.js --network polygonAmoy

# Deploy to Polygon Mainnet
npx hardhat run scripts/deploy.js --network polygon

# Verify contract on Polygonscan
npx hardhat verify --network polygonAmoy <CONTRACT_ADDRESS>
```

### Frontend

```bash
# Install dependencies
cd frontend && npm install

# Development mode
npm run dev

# Production build
npm run build

# Start production server
npm start
```

## Environment Variables

### Root `.env`
```env
POLYGON_AMOY_RPC_URL=https://rpc-amoy.polygon.technology
PRIVATE_KEY=your_private_key
POLYGONSCAN_API_KEY=your_api_key
```

### Frontend `.env.local`
```env
NEXT_PUBLIC_CREATOR_REGISTRY_ADDRESS=0x...
NEXT_PUBLIC_TRUTHCHAIN_ADDRESS=0x...
NEXT_PUBLIC_NETWORK_NAME=polygonAmoy
NEXT_PUBLIC_CHAIN_ID=80002
NEXT_PUBLIC_RPC_URL=https://rpc-amoy.polygon.technology
NEXT_PUBLIC_PINATA_API_KEY=your_key
NEXT_PUBLIC_PINATA_SECRET_KEY=your_secret
NEXT_PUBLIC_PINATA_JWT=your_jwt
```

## Network Configuration

### Polygon Amoy Testnet
- **Network Name:** Polygon Amoy
- **RPC URL:** https://rpc-amoy.polygon.technology
- **Chain ID:** 80002
- **Currency:** MATIC
- **Explorer:** https://amoy.polygonscan.com/

### Polygon Mainnet
- **Network Name:** Polygon Mainnet
- **RPC URL:** https://polygon-rpc.com
- **Chain ID:** 137
- **Currency:** MATIC
- **Explorer:** https://polygonscan.com/

## Contract Addresses

After deployment, your contract addresses will be in:
```
deployments/polygonAmoy.json
```

Example:
```json
{
  "network": "polygonAmoy",
  "creatorRegistry": "0x...",
  "truthChain": "0x...",
  "deployer": "0x...",
  "timestamp": "2025-11-25T..."
}
```

## Useful Links

### Getting Started
- **Polygon Faucet:** https://faucet.polygon.technology/
- **Pinata Dashboard:** https://app.pinata.cloud/
- **Alchemy Dashboard:** https://www.alchemy.com/
- **MetaMask:** https://metamask.io/

### Documentation
- **Polygon Docs:** https://docs.polygon.technology/
- **Hardhat Docs:** https://hardhat.org/docs
- **Next.js Docs:** https://nextjs.org/docs
- **ethers.js Docs:** https://docs.ethers.org/

### Explorers
- **Amoy Testnet:** https://amoy.polygonscan.com/
- **Polygon Mainnet:** https://polygonscan.com/

## Troubleshooting

### "Insufficient funds for gas"
```bash
# Get testnet MATIC from faucet
# Visit: https://faucet.polygon.technology/
```

### "Network not supported"
Add Polygon Amoy to MetaMask:
- Network Name: Polygon Amoy
- RPC URL: https://rpc-amoy.polygon.technology
- Chain ID: 80002
- Currency: MATIC

### "Contract not found"
Check that:
1. Contracts are deployed
2. Addresses in `.env.local` are correct
3. You're on the correct network

### "IPFS upload failed"
Verify:
1. Pinata API keys are correct
2. You have IPFS quota remaining
3. Network connection is stable

## Smart Contract Functions

### CreatorRegistry

```solidity
// Register as creator
registerCreator(string name, string organization)

// Verify creator (owner only)
verifyCreator(address creatorAddress)

// Get creator info
getCreator(address creatorAddress)

// Check if verified
isVerifiedCreator(address creatorAddress)
```

### TruthChain

```solidity
// Register new content
registerContent(bytes32 contentHash, string ipfsHash)

// Register content update
registerContentUpdate(bytes32 newHash, bytes32 previousHash, string ipfsHash)

// Verify content
verifyContent(bytes32 contentHash)

// Get version history
getContentVersions(bytes32 contentId)

// Get content record
getContentRecord(bytes32 contentHash)
```

## File Structure

```
TruthChain/
├── contracts/              # Smart contracts
│   ├── CreatorRegistry.sol
│   └── TruthChain.sol
├── scripts/               # Deployment scripts
│   └── deploy.js
├── frontend/              # Next.js app
│   ├── app/              # Pages
│   ├── components/       # React components
│   ├── contexts/         # React contexts
│   └── lib/              # Utilities
├── deployments/          # Deployment info
├── .env                  # Backend config
├── hardhat.config.js     # Hardhat config
└── README.md            # Documentation
```

## Git Commands

```bash
# Initialize repository
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit"

# Add remote
git remote add origin <your-repo-url>

# Push to GitHub
git push -u origin main
```

## Vercel Deployment

```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Deploy
cd frontend
vercel

# Deploy to production
vercel --prod
```

## Testing Checklist

- [ ] Contracts compile successfully
- [ ] Contracts deploy to testnet
- [ ] Frontend connects to MetaMask
- [ ] Creator registration works
- [ ] Content upload works
- [ ] Content verification works
- [ ] IPFS upload works
- [ ] All pages load correctly
- [ ] Responsive design works
- [ ] Error handling works

## Production Checklist

- [ ] Smart contracts audited
- [ ] Environment variables configured
- [ ] Contracts deployed to mainnet
- [ ] Contracts verified on Polygonscan
- [ ] Frontend deployed to Vercel
- [ ] Custom domain configured
- [ ] SSL certificate active
- [ ] Analytics configured
- [ ] Error monitoring setup
- [ ] Backup procedures in place

## Support

- **Documentation:** See README.md and DEPLOYMENT.md
- **Issues:** Open an issue on GitHub
- **Community:** Join our Discord/Telegram

---

**Quick Start:**
```bash
npm install
cd frontend && npm install && cd ..
npx hardhat compile
npx hardhat run scripts/deploy.js --network polygonAmoy
cd frontend && npm run dev
```

Visit http://localhost:3000 🚀
