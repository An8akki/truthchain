---
description: TruthChain Implementation Plan
---

# TruthChain - Blockchain-Powered Content Verification System

## Technology Stack

### Frontend
- **Framework**: Next.js 14 (React with App Router)
- **Styling**: Tailwind CSS + shadcn/ui components
- **Web3**: ethers.js v6
- **State Management**: React Context + Hooks
- **UI Components**: Radix UI primitives via shadcn/ui
- **Animations**: Framer Motion
- **Icons**: Lucide React

### Backend/Blockchain
- **Smart Contracts**: Solidity 0.8.x
- **Blockchain Network**: Polygon Mumbai Testnet (easy deployment, low cost)
- **Development**: Hardhat
- **Storage**: IPFS via Pinata API
- **Wallet**: MetaMask integration

### Additional Tools
- **Hashing**: crypto-js (SHA-256)
- **IPFS Client**: Pinata SDK
- **Testing**: Hardhat tests for contracts

## Project Structure

```
TruthChain/
├── frontend/                 # Next.js application
│   ├── app/                 # App router pages
│   ├── components/          # React components
│   ├── lib/                 # Utilities, web3 helpers
│   ├── contexts/            # React contexts
│   └── public/              # Static assets
├── contracts/               # Smart contracts
│   ├── TruthChain.sol      # Main verification contract
│   └── CreatorRegistry.sol # Creator identity management
├── scripts/                 # Deployment scripts
├── test/                    # Contract tests
└── hardhat.config.js       # Hardhat configuration
```

## Smart Contract Architecture

### 1. CreatorRegistry.sol
- Register verified creators
- Store creator metadata (name, organization, wallet address)
- Track reputation scores
- Only owner can verify creators initially

### 2. TruthChain.sol
- Store content hashes with timestamps
- Link content to creator addresses
- Track version history
- Emit events for indexing
- Verify content authenticity

## Implementation Phases

### Phase 1: Setup & Smart Contracts (Step 1-3)
1. Initialize Next.js project with TypeScript
2. Setup Hardhat for smart contract development
3. Write and test smart contracts
4. Deploy to Polygon Mumbai testnet

### Phase 2: IPFS Integration (Step 4-5)
5. Setup Pinata account and API keys
6. Create IPFS upload utilities
7. Test metadata storage

### Phase 3: Frontend Core (Step 6-10)
8. Setup Web3 context and MetaMask connection
9. Create design system with Tailwind
10. Build component library (buttons, cards, modals)
11. Implement wallet connection flow
12. Create navigation and layout

### Phase 4: Creator Features (Step 11-14)
13. Creator registration page
14. Content upload interface
15. Hash generation and blockchain submission
16. Creator dashboard with content management

### Phase 5: Verification Features (Step 15-17)
17. Content verification portal
18. Hash comparison logic
19. Results display (Authentic/Edited/Not Verified)
20. Version history viewer

### Phase 6: Polish & Deploy (Step 18-20)
21. Reputation score calculation
22. UI/UX refinements and animations
23. Testing and bug fixes
24. Deployment documentation

## Environment Variables Needed

```
# Frontend (.env.local)
NEXT_PUBLIC_POLYGON_RPC_URL=
NEXT_PUBLIC_TRUTHCHAIN_CONTRACT_ADDRESS=
NEXT_PUBLIC_CREATOR_REGISTRY_CONTRACT_ADDRESS=
NEXT_PUBLIC_PINATA_API_KEY=
NEXT_PUBLIC_PINATA_SECRET_KEY=

# Hardhat (.env)
POLYGON_MUMBAI_RPC_URL=
PRIVATE_KEY=
POLYGONSCAN_API_KEY=
```

## Deployment Strategy

1. **Smart Contracts**: Deploy to Polygon Mumbai using Hardhat
2. **Frontend**: Deploy to Vercel (seamless Next.js integration)
3. **IPFS**: Use Pinata for reliable pinning

## Key Features Implementation Details

### Content Hashing
- Use SHA-256 for consistent, deterministic hashing
- Hash content before upload
- Store hash on blockchain with timestamp

### Verification Flow
1. User inputs content (text/URL/file)
2. System generates hash
3. Query blockchain for matching hash
4. Display result with metadata from IPFS

### Version History
- Each update creates new hash entry
- Link versions via content ID
- Display timeline of all versions

### Reputation System
- Track: uploads count, verification requests
- Simple score: (verified uploads / total uploads) * 100
- Display on creator profile

## Success Criteria

✅ Users can connect MetaMask wallet
✅ Creators can register on-chain
✅ Creators can upload content with metadata to IPFS
✅ Content hash stored on Polygon blockchain
✅ Anyone can verify content authenticity
✅ Version history visible and transparent
✅ Clean, professional UI
✅ Easy deployment with documentation
