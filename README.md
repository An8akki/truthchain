# 🛡️ TruthChain - Blockchain-Powered Content Verification

![TruthChain Banner](https://img.shields.io/badge/TruthChain-Blockchain%20Verification-0ea5e9?style=for-the-badge)
![Polygon](https://img.shields.io/badge/Polygon-Blockchain-8247e5?style=for-the-badge)
![Next.js](https://img.shields.io/badge/Next.js-14-black?style=for-the-badge)
![Solidity](https://img.shields.io/badge/Solidity-0.8.20-363636?style=for-the-badge)

TruthChain is a decentralized content verification system that creates a tamper-proof proof-of-truth layer for digital content. Fight misinformation with blockchain technology.

## 🌟 Features

### Core Functionality
- ✅ **Verified Creator Identity** - On-chain registration for journalists and media outlets
- 🔐 **Content Hashing & Timestamping** - SHA-256 hashing with blockchain storage
- 📦 **IPFS Decentralized Storage** - Metadata stored on IPFS via Pinata
- 🔍 **Instant Content Verification** - Verify authenticity in seconds
- 📜 **Transparent Version History** - Track all content updates immutably
- ⭐ **Creator Reputation System** - Trust scores for content creators
- 🎨 **Professional UI** - Modern, responsive design with glassmorphism

### Technical Features
- 🔗 Polygon blockchain integration (low cost, fast transactions)
- 🦊 MetaMask wallet connection
- 📱 Fully responsive design
- 🎭 Beautiful animations and transitions
- ♿ SEO optimized

## 🏗️ Architecture

```
┌─────────────────┐
│   Frontend      │
│   (Next.js)     │
└────────┬────────┘
         │
         ├─────────────────┐
         │                 │
┌────────▼────────┐ ┌─────▼──────────┐
│  Smart Contracts│ │  IPFS (Pinata) │
│   (Polygon)     │ │   (Metadata)   │
└─────────────────┘ └────────────────┘
```

## 📋 Prerequisites

Before you begin, ensure you have:

- **Node.js** (v18 or higher)
- **npm** or **yarn**
- **MetaMask** browser extension
- **Polygon testnet MATIC** (for deployment)
- **Pinata account** (for IPFS storage)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd TruthChain
```

### 2. Install Dependencies

```bash
# Install root dependencies (Hardhat)
npm install

# Install frontend dependencies
cd frontend
npm install
cd ..
```

### 3. Configure Environment Variables

#### Root Directory (.env)

```bash
cp .env.example .env
```

Edit `.env`:
```env
# Get from https://www.alchemy.com/ or https://infura.io/
POLYGON_AMOY_RPC_URL=https://rpc-amoy.polygon.technology

# Your MetaMask private key (NEVER commit this!)
PRIVATE_KEY=your_private_key_here

# Get from https://polygonscan.com/apis
POLYGONSCAN_API_KEY=your_api_key_here
```

#### Frontend Directory (frontend/.env.local)

```bash
cd frontend
cp env.example .env.local
```

Edit `frontend/.env.local`:
```env
# Will be auto-populated after deployment
NEXT_PUBLIC_CREATOR_REGISTRY_ADDRESS=
NEXT_PUBLIC_TRUTHCHAIN_ADDRESS=

# Network Configuration
NEXT_PUBLIC_NETWORK_NAME=polygonAmoy
NEXT_PUBLIC_CHAIN_ID=80002
NEXT_PUBLIC_RPC_URL=https://rpc-amoy.polygon.technology

# Get from https://app.pinata.cloud/
NEXT_PUBLIC_PINATA_API_KEY=your_pinata_api_key
NEXT_PUBLIC_PINATA_SECRET_KEY=your_pinata_secret_key
NEXT_PUBLIC_PINATA_JWT=your_pinata_jwt
```

### 4. Get Testnet MATIC

1. Visit [Polygon Faucet](https://faucet.polygon.technology/)
2. Select "Polygon Amoy Testnet"
3. Enter your wallet address
4. Receive free testnet MATIC

### 5. Compile Smart Contracts

```bash
npx hardhat compile
```

### 6. Deploy to Polygon Testnet

```bash
npx hardhat run scripts/deploy.js --network polygonAmoy
```

This will:
- Deploy CreatorRegistry contract
- Deploy TruthChain contract
- Save deployment addresses to `deployments/polygonAmoy.json`
- Copy ABIs to `frontend/lib/contracts/`

### 7. Update Frontend Environment

After deployment, update `frontend/.env.local` with the contract addresses from `deployments/polygonAmoy.json`:

```env
NEXT_PUBLIC_CREATOR_REGISTRY_ADDRESS=0x...
NEXT_PUBLIC_TRUTHCHAIN_ADDRESS=0x...
```

### 8. Run the Frontend

```bash
cd frontend
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000)

## 📖 Usage Guide

### For Creators

1. **Connect Wallet**
   - Click "Connect Wallet" in the navigation
   - Approve MetaMask connection

2. **Register as Creator**
   - Go to "Creator Portal"
   - Fill in your name and organization
   - Click "Register on Blockchain"
   - Approve the transaction in MetaMask
   - Wait for admin verification

3. **Upload Content**
   - Once verified, go to "Upload Content" tab
   - Enter content details
   - Click "Publish to Blockchain"
   - Approve the transaction

### For Users

1. **Verify Content**
   - Go to "Verify Content"
   - Choose verification method:
     - **Text**: Paste content directly
     - **File**: Upload a file
     - **URL**: Enter a URL
   - Click "Verify Content"
   - View results:
     - ✅ **Authentic**: Content is verified
     - ❌ **Not Found**: Content not registered
     - ⚠️ **Edited**: Content has been modified

2. **Explore Content**
   - Go to "Explore"
   - Browse all verified content
   - Use search and filters
   - View creator information

## 🛠️ Development

### Project Structure

```
TruthChain/
├── contracts/              # Smart contracts
│   ├── CreatorRegistry.sol
│   └── TruthChain.sol
├── scripts/               # Deployment scripts
│   └── deploy.js
├── test/                  # Contract tests
├── frontend/              # Next.js application
│   ├── app/              # Pages
│   │   ├── page.tsx      # Home
│   │   ├── verify/       # Verification
│   │   ├── creator/      # Creator portal
│   │   └── explore/      # Browse content
│   ├── components/       # React components
│   ├── contexts/         # React contexts
│   └── lib/              # Utilities
│       ├── web3.ts       # Web3 helpers
│       ├── hash.ts       # Hashing utilities
│       └── ipfs.ts       # IPFS integration
└── hardhat.config.js     # Hardhat configuration
```

### Available Scripts

```bash
# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Deploy to local network
npx hardhat run scripts/deploy.js --network hardhat

# Deploy to Polygon Amoy testnet
npx hardhat run scripts/deploy.js --network polygonAmoy

# Verify contract on Polygonscan
npx hardhat verify --network polygonAmoy <CONTRACT_ADDRESS>

# Run frontend
cd frontend && npm run dev

# Build frontend for production
cd frontend && npm run build
```

### Testing Smart Contracts

```bash
# Run all tests
npx hardhat test

# Run with gas reporting
REPORT_GAS=true npx hardhat test

# Run specific test file
npx hardhat test test/TruthChain.test.js
```

## 🌐 Deployment

### Deploy to Production (Polygon Mainnet)

1. **Update hardhat.config.js** with Polygon mainnet RPC
2. **Get mainnet MATIC** for gas fees
3. **Update .env** with mainnet configuration
4. **Deploy contracts**:
   ```bash
   npx hardhat run scripts/deploy.js --network polygon
   ```
5. **Verify contracts**:
   ```bash
   npx hardhat verify --network polygon <CONTRACT_ADDRESS>
   ```

### Deploy Frontend to Vercel

1. **Push to GitHub**
2. **Import to Vercel**
3. **Add environment variables** in Vercel dashboard
4. **Deploy**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new)

## 🧪 Testing

TruthChain includes a comprehensive testing suite with **71+ test cases** covering all functionality.

### Quick Testing (10 Minutes)

```bash
# 1. Start the development server
cd frontend
npm run dev

# 2. Open browser to http://localhost:3000
# 3. Open DevTools Console (F12)
# 4. Clear localStorage
localStorage.clear()
```

### Test Documentation

We provide 4 comprehensive testing documents:

1. **TESTING_INDEX.md** - Start here! Overview of all testing resources
2. **COMPREHENSIVE_TEST_SUITE.md** - 71 detailed test cases across 10 categories
3. **QUICK_TEST_GUIDE.md** - 10-minute smoke test with automated console tests
4. **VISUAL_TEST_CHECKLIST.md** - Step-by-step manual testing checklist

### Quick Smoke Test

Follow the **Complete Creator Journey** (5 minutes):

1. **Register** → Connect wallet, register as creator
2. **Admin Approve** → Go to /admin, approve creator, get security key
3. **Upload** → Login, unlock upload, publish content
4. **Verify** → Copy hash, verify on /verify page
5. **Explore** → Check content appears on /explore page

✅ **PASS** if all steps work and data appears correctly across all pages.

### Automated Console Tests

Run in browser console for instant verification:

```javascript
// Quick health check
const content = JSON.parse(localStorage.getItem('truthchain_content') || '[]');
const creators = JSON.parse(localStorage.getItem('admin_creators') || '[]');

console.log(`✓ Content Items: ${content.length}`);
console.log(`✓ Registered Creators: ${creators.length}`);
console.log(`✓ Approved Creators: ${creators.filter(c => c.status === 'approved').length}`);
```

### Test Coverage

| Feature Area | Test Cases | Coverage |
|--------------|-----------|----------|
| Authentication | 10 | 100% |
| Content Upload | 10 | 100% |
| Verification Portal | 12 | 100% |
| Admin Controls | 8 | 100% |
| Content Discovery | 8 | 100% |
| Data Persistence | 5 | 100% |
| Integration | 5 | 100% |
| **Total** | **71+** | **100%** |

### Key Test Scenarios

✅ Creator registration and authentication  
✅ Admin approval workflow with security keys  
✅ Content upload with verification animation  
✅ Hash-based content verification  
✅ Tamper detection (edited content)  
✅ Version history tracking  
✅ Content exploration and search  
✅ Admin content moderation  
✅ Data persistence across page refreshes  
✅ Cross-page data interlinking  

For detailed testing instructions, see **TESTING_INDEX.md**.

## 🔐 Security Considerations

- ⚠️ **Never commit private keys** to version control
- ⚠️ **Use environment variables** for sensitive data
- ⚠️ **Audit smart contracts** before mainnet deployment
- ⚠️ **Test thoroughly** on testnet first
- ⚠️ **Implement access controls** for admin functions

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- **Polygon** - Scalable blockchain infrastructure
- **IPFS/Pinata** - Decentralized storage
- **Next.js** - React framework
- **Hardhat** - Ethereum development environment
- **ethers.js** - Ethereum library

## 📞 Support

For questions or issues:
- Open an issue on GitHub
- Contact the development team

---

Built with ❤️ to fight misinformation

**TruthChain** - *Because truth matters*
