# 🛡️ TruthChain - Complete Technical Documentation

## 📋 Table of Contents
1. [Project Overview](#project-overview)
2. [Tech Stack](#tech-stack)
3. [Architecture](#architecture)
4. [Core Functionalities](#core-functionalities)
5. [Features Breakdown](#features-breakdown)
6. [Data Flow](#data-flow)
7. [Security Features](#security-features)
8. [API Reference](#api-reference)
9. [Database Schema](#database-schema)
10. [Deployment](#deployment)

---

## 🎯 Project Overview

**TruthChain** is a decentralized content verification system that creates a tamper-proof proof-of-truth layer for digital content. It leverages blockchain technology to fight misinformation by providing immutable content verification, creator authentication, and transparent version history.

### Mission
Combat misinformation through blockchain-powered content verification and creator accountability.

### Key Value Propositions
- ✅ **Immutable Content Records** - Once verified, content cannot be altered without detection
- ✅ **Creator Accountability** - Verified creator identities with reputation scores
- ✅ **Tamper Detection** - Instant detection of modified or fake content
- ✅ **Transparent History** - Complete version tracking for all content updates
- ✅ **Decentralized Trust** - No single point of control or censorship

---

## 💻 Tech Stack

### Frontend Technologies

#### Core Framework
- **Next.js 14** (App Router)
  - React 18 with Server Components
  - File-based routing
  - Built-in optimization
  - TypeScript support

#### UI/Styling
- **CSS Modules** - Scoped styling
- **Vanilla CSS** - Custom design system
- **Glassmorphism** - Modern UI effects
- **Responsive Design** - Mobile-first approach

#### State Management
- **React Context API**
  - `Web3Context` - Wallet connection state
  - `ThemeContext` - UI theme management (if implemented)

#### Libraries & Tools
- **lucide-react** - Icon library (200+ icons)
- **recharts** - Analytics charts
- **crypto-js** - Client-side hashing (SHA-256)
- **ethers.js** - Ethereum/Polygon interaction
- **TypeScript** - Type safety

### Backend Technologies

#### Blockchain
- **Polygon (Amoy Testnet)** - Layer 2 scaling solution
  - Low transaction costs (~$0.001)
  - Fast confirmation times (~2 seconds)
  - EVM compatible
  - Mainnet ready

#### Smart Contracts
- **Solidity 0.8.20** - Contract language
- **Hardhat** - Development environment
  - Contract compilation
  - Testing framework
  - Deployment scripts
  - Network configuration

#### Storage
- **IPFS (Pinata)** - Decentralized file storage
  - Content metadata storage
  - Immutable file addressing
  - CDN integration
- **LocalStorage** - Client-side data (demo mode)
  - Creator credentials
  - Content cache
  - User preferences

### Development Tools

#### Build & Bundling
- **Webpack** (via Next.js)
- **Turbopack** (Next.js 14 dev mode)
- **SWC** - Fast TypeScript/JavaScript compiler

#### Testing
- **Hardhat Test** - Smart contract testing
- **Mocha/Chai** - Test framework
- **Manual Testing** - 71+ test cases documented

#### Version Control
- **Git** - Source control
- **GitHub** - Repository hosting

#### Package Management
- **npm** - Node package manager

---

## 🏗️ Architecture

### System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        USER INTERFACE                        │
│                     (Next.js Frontend)                       │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐   │
│  │   Home   │  │  Verify  │  │ Creator  │  │  Explore │   │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘   │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ├─────────────────┬─────────────────┐
                     │                 │                 │
         ┌───────────▼──────────┐ ┌───▼────────┐ ┌─────▼──────┐
         │   Web3 Provider      │ │   IPFS     │ │ LocalStorage│
         │   (MetaMask)         │ │  (Pinata)  │ │   (Cache)   │
         └───────────┬──────────┘ └────────────┘ └─────────────┘
                     │
         ┌───────────▼──────────┐
         │  Polygon Blockchain  │
         │  ┌────────────────┐  │
         │  │ CreatorRegistry│  │
         │  │   Contract     │  │
         │  └────────────────┘  │
         │  ┌────────────────┐  │
         │  │  TruthChain    │  │
         │  │   Contract     │  │
         │  └────────────────┘  │
         └──────────────────────┘
```

### Component Architecture

```
frontend/
├── app/                          # Next.js App Router
│   ├── page.tsx                  # Home page
│   ├── layout.tsx                # Root layout
│   ├── globals.css               # Global styles
│   ├── verify/
│   │   └── page.tsx              # Verification portal
│   ├── creator/
│   │   └── page.tsx              # Creator dashboard
│   ├── explore/
│   │   └── page.tsx              # Content exploration
│   └── admin/
│       └── page.tsx              # Admin panel
├── components/
│   └── Navigation.tsx            # Global navigation
├── contexts/
│   └── Web3Context.tsx           # Wallet state management
├── lib/
│   ├── web3.ts                   # Web3 utilities
│   ├── hash.ts                   # Hashing functions
│   ├── ipfs.ts                   # IPFS integration
│   ├── creatorAuth.ts            # Authentication logic
│   └── contracts/                # Contract ABIs
└── public/
    ├── cosmos_bg.png             # Background image
    └── admin_bg.png              # Admin background
```

---

## ⚙️ Core Functionalities

### 1. Creator Management System

#### Registration
- **Username/Password Authentication**
  - Unique username validation
  - Password hashing (client-side)
  - Wallet address binding
  - Organization affiliation

#### Admin Approval Workflow
- **Pending Status** - Initial registration state
- **Approval Process** - Admin review and verification
- **Security Key Generation** - 12-character alphanumeric key
- **Inbox Notification** - Automated message delivery
- **Status Tracking** - Pending → Approved → Rejected

#### Authentication
- **Login System** - Username + password
- **Session Management** - Requires re-login after page refresh
- **Password Reset** - Username-based recovery
- **Multi-Wallet Support** - Different wallets = different accounts

### 2. Content Upload & Management

#### Upload Process
```
1. Creator Login → 2. Security Key Unlock → 3. Fill Form → 
4. Verification Animation (4 steps) → 5. Hash Generation → 
6. Blockchain Storage → 7. Success Confirmation
```

#### Content Fields
- **Title** - Article/content headline
- **Description** - Brief summary
- **Content** - Full text/data
- **Content Type** - news, article, report, image, video
- **Origin Proof** - Source URL for verification
- **Creator** - Wallet address (auto-filled)
- **Timestamp** - Upload time (auto-generated)
- **Hash** - SHA-256 content hash (auto-generated)
- **Version** - Version number (auto-incremented)

#### Content Operations
- **Create** - Upload new content
- **Read** - View content details
- **Update** - Edit existing content (creates new version)
- **Delete** - Remove content from system

#### Version Control
- **Automatic Versioning** - v1, v2, v3...
- **History Tracking** - All previous versions stored
- **Hash Per Version** - Each version has unique hash
- **Timestamp Per Version** - Track when changes occurred

### 3. Content Verification System

#### Verification Methods

##### A. Hash Verification
```javascript
Input: 0xabcd1234efgh5678
Process: Direct hash lookup in blockchain
Output: Authentic / Unverified
```

##### B. Text Verification
```javascript
Input: "Article text content"
Process: 
  1. Calculate SHA-256 hash of text
  2. Search blockchain for hash
  3. Optional: Compare with reference hash
Output: Authentic / Edited / Unverified
```

##### C. File Verification
```javascript
Input: file.pdf (binary upload)
Process:
  1. Read file as ArrayBuffer
  2. Calculate SHA-256 hash of binary
  3. Search blockchain for hash
  4. Optional: Compare with reference hash
Output: Authentic / Edited / Unverified
```

##### D. Creator Verification
```javascript
Input: 0x1234abc567def890 (wallet address)
Process: Redirect to creator profile
Output: Creator profile page with all content
```

#### Verification Results

**Authentic (Blue Shield)**
- Hash found in blockchain
- Content matches exactly
- Shows: Title, Creator, Timestamp, Version

**Edited/Tampered (Yellow Alert)**
- Reference hash found in blockchain
- Computed hash doesn't match
- Shows: Both hashes for comparison

**Unverified (Red X)**
- Hash not found in blockchain
- Content not registered
- Shows: Computed hash only

### 4. Content Exploration

#### Features
- **Grid View** - Card-based content display
- **Search** - By title, creator name, or wallet address
- **Filter** - By content type (news, article, report, etc.)
- **Combined Search + Filter** - Narrow results
- **Content Preview** - Click to view full details
- **Modal View** - Full content display with metadata

#### Content Card Display
- Content type badge
- Verified badge (green checkmark)
- Title
- Description (truncated to 120 chars)
- Creator avatar
- Creator name
- Wallet address
- Upload date
- Version number

### 5. Admin Panel

#### Creator Management
- **View All Creators** - Pending, Approved, Rejected tabs
- **Approve Creators** - Generate security key
- **Reject Creators** - Deny verification
- **View Creator Details** - Name, org, wallet, registration date

#### Content Moderation
- **View All Content** - Complete content list
- **Block Content** - Hide from Explore page
- **Unblock Content** - Restore visibility
- **View Content Details** - Full metadata

#### Security Key System
- **Automatic Generation** - On approval
- **12-Character Format** - Alphanumeric (a-z, 0-9)
- **One-Time Display** - Shown once to admin
- **Inbox Delivery** - Sent to creator's inbox
- **Unlock Mechanism** - Required for upload feature

### 6. Analytics Dashboard

#### Creator Statistics
- **Total Uploads** - Count of published content
- **Reputation Score** - Calculated: `min(5.0, uploads * 0.1 + 3.0)`
- **Upload Trend Chart** - Line chart showing uploads over time
- **Content Type Distribution** - Breakdown by category

#### Metrics Tracked
- Upload count per day
- Total content items
- Version history depth
- Creator verification status

---

## 🔐 Security Features

### 1. Content Integrity

#### Hash-Based Verification
- **SHA-256 Algorithm** - Industry-standard cryptographic hash
- **Deterministic** - Same content = same hash
- **Collision Resistant** - Virtually impossible to forge
- **One-Way Function** - Cannot reverse hash to content

#### Tamper Detection
```javascript
Original Hash: 0xabcd1234efgh5678
Modified Content Hash: 0x9999aaaa7777bbbb
Result: TAMPERED (hashes don't match)
```

### 2. Creator Authentication

#### Multi-Layer Security
1. **Username/Password** - First authentication layer
2. **Wallet Address** - Blockchain identity binding
3. **Security Key** - Admin-issued unlock token
4. **Session Management** - Requires re-authentication

#### Password Security
- Client-side hashing (not stored in plain text)
- Unique username enforcement
- Wallet-username binding

### 3. Admin Controls

#### Access Control
- Admin panel accessible to all (demo mode)
- Production: Role-based access control (RBAC)
- Approval workflow prevents unauthorized uploads

#### Content Moderation
- Block/unblock functionality
- Visibility control
- Audit trail (timestamps)

### 4. Data Persistence

#### LocalStorage Security
- Client-side only (demo mode)
- Encrypted in production
- Regular cleanup recommended
- Size limits enforced (5MB browser limit)

---

## 📊 Data Flow

### Content Upload Flow

```
┌─────────────┐
│   Creator   │
│   Inputs    │
│   Content   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Calculate  │
│  SHA-256    │
│    Hash     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Store in  │
│ LocalStorage│
│  (Demo Mode)│
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Update    │
│   Explore   │
│    Page     │
└─────────────┘
```

### Verification Flow

```
┌─────────────┐
│    User     │
│   Inputs    │
│ Hash/Text/  │
│    File     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Calculate  │
│    Hash     │
│ (if needed) │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Search    │
│ LocalStorage│
│  for Hash   │
└──────┬──────┘
       │
       ├─── Found ────▶ Authentic
       │
       ├─── Found but ─▶ Edited
       │    different
       │
       └─── Not Found ─▶ Unverified
```

### Admin Approval Flow

```
┌─────────────┐
│   Creator   │
│  Registers  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Status:   │
│   Pending   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│    Admin    │
│   Reviews   │
└──────┬──────┘
       │
       ├─── Approve ──▶ Generate Security Key
       │                      │
       │                      ▼
       │               Send to Inbox
       │                      │
       │                      ▼
       │               Status: Approved
       │
       └─── Reject ───▶ Status: Rejected
```

---

## 🗄️ Database Schema (LocalStorage)

### truthchain_content
```typescript
interface ContentItem {
  id: string;                    // Unique identifier
  title: string;                 // Content title
  description: string;           // Brief summary
  content: string;               // Full content text
  contentType: string;           // news, article, report, etc.
  originProof: string;           // Source URL
  creator: string;               // Wallet address
  creatorName: string;           // Creator username
  timestamp: number;             // Upload time (ms)
  hash: string;                  // SHA-256 hash (0x...)
  version: number;               // Version number
  history?: ContentItem[];       // Previous versions
  blocked?: boolean;             // Admin moderation flag
}
```

### admin_creators
```typescript
interface AdminCreatorEntry {
  id: string;                    // Unique identifier
  address: string;               // Wallet address
  name: string;                  // Creator username
  organization: string;          // Organization name
  registeredAt: number;          // Registration timestamp (seconds)
  status: "pending" | "approved" | "rejected";
  securityKey?: string;          // 12-char unlock key (if approved)
}
```

### truthchain_creator_creds
```typescript
interface CreatorCredentials {
  name: string;                  // Username
  organization: string;          // Organization
  password: string;              // Hashed password
  walletAddress: string;         // Ethereum address
  registeredAt: number;          // Registration timestamp (ms)
}
```

### truthchain_messages_{address}
```typescript
interface Message {
  id: string;                    // Message ID
  sender: string;                // "System" or "Admin"
  content: string;               // Message text (security key)
  timestamp: number;             // Message time (ms)
  read: boolean;                 // Read status
  type: 'system' | 'admin';      // Message type
}
```

### truthchain_unlock_{address}
```
Value: 'true' | 'false'
Purpose: Track if upload feature is unlocked
```

---

## 🎨 Design System

### Color Palette

#### Primary Colors
- **Green (Success)**: `#00ff41` - Verified, Authentic, Primary actions
- **Blue (Info)**: `#007aff` - Authentic content, Links
- **Yellow (Warning)**: `#ffd700` - Edited/Tampered content
- **Red (Error)**: `#ff3b30` - Unverified, Errors, Rejected

#### Neutral Colors
- **Black**: `#000000` - Background
- **Dark Gray**: `#111111` - Cards, containers
- **Medium Gray**: `#858585` - Secondary text
- **Light Gray**: `#ffffff` - Primary text

#### Transparency
- **Card Background**: `rgba(17, 17, 17, 0.6)`
- **Border**: `rgba(0, 255, 65, 0.15)`
- **Overlay**: `rgba(0, 0, 0, 0.6)`

### Typography
- **Headings**: System font stack (sans-serif)
- **Body**: System font stack
- **Monospace**: For hashes, addresses, code

### Spacing
- **Small**: 8px, 12px, 16px
- **Medium**: 24px, 32px, 40px
- **Large**: 60px, 80px

### Border Radius
- **Small**: 6px, 8px
- **Medium**: 12px, 20px
- **Large**: 50% (circles)

---

## 🚀 Deployment

### Development
```bash
# Frontend
cd frontend
npm run dev
# Runs on http://localhost:3000

# Smart Contracts (if using blockchain)
npx hardhat compile
npx hardhat test
npx hardhat run scripts/deploy.js --network polygonAmoy
```

### Production Build
```bash
cd frontend
npm run build
npm start
```

### Environment Variables

#### Frontend (.env.local)
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

#### Backend (.env)
```env
POLYGON_AMOY_RPC_URL=https://rpc-amoy.polygon.technology
PRIVATE_KEY=your_private_key
POLYGONSCAN_API_KEY=your_api_key
```

### Deployment Platforms

#### Frontend
- **Vercel** (Recommended for Next.js)
- **Netlify**
- **AWS Amplify**
- **Railway**

#### Smart Contracts
- **Polygon Amoy Testnet** (Testing)
- **Polygon Mainnet** (Production)

---

## 📈 Performance Metrics

### Target Benchmarks
- **Page Load Time**: < 2 seconds
- **Verification Time**: < 2 seconds
- **Upload Success Rate**: 100%
- **Hash Accuracy**: 100%
- **Data Persistence**: 100%
- **Console Errors**: 0

### Optimization Techniques
- **Code Splitting** - Next.js automatic
- **Image Optimization** - Next.js Image component
- **Lazy Loading** - React.lazy for components
- **Caching** - LocalStorage for frequently accessed data
- **Minification** - Production build optimization

---

## 🔧 API Reference

### Web3 Context

```typescript
interface Web3ContextType {
  account: string | null;
  isConnected: boolean;
  connectWallet: () => Promise<void>;
  disconnectWallet: () => void;
}

// Usage
const { account, isConnected, connectWallet } = useWeb3();
```

### Hash Generation

```typescript
// Text hashing
function generateContentHash(content: string): string {
  return "0x" + CryptoJS.SHA256(content).toString();
}

// File hashing
async function calculateHash(file: File): Promise<string> {
  const reader = new FileReader();
  return new Promise((resolve, reject) => {
    reader.onload = (e) => {
      const binary = e.target?.result;
      const wordArray = CryptoJS.lib.WordArray.create(binary as any);
      resolve("0x" + CryptoJS.SHA256(wordArray).toString());
    };
    reader.readAsArrayBuffer(file);
  });
}
```

### Creator Authentication

```typescript
// Save credentials
saveCreatorCredentials({
  name: string,
  organization: string,
  password: string,
  walletAddress: string,
  registeredAt: number
});

// Verify password
verifyCreatorPassword(walletAddress: string, password: string): boolean;

// Get credentials
getCreatorCredentials(walletAddress: string): CreatorCredentials | null;
```

---

## 📚 Additional Resources

### Documentation Files
- **README.md** - Quick start guide
- **TESTING_INDEX.md** - Testing documentation hub
- **COMPREHENSIVE_TEST_SUITE.md** - 71 test cases
- **QUICK_TEST_GUIDE.md** - Fast testing guide
- **VISUAL_TEST_CHECKLIST.md** - Manual testing checklist
- **DEPLOYMENT.md** - Deployment instructions

### External Resources
- [Next.js Documentation](https://nextjs.org/docs)
- [Polygon Documentation](https://docs.polygon.technology/)
- [Hardhat Documentation](https://hardhat.org/docs)
- [IPFS Documentation](https://docs.ipfs.tech/)
- [Pinata Documentation](https://docs.pinata.cloud/)

---

## 🎯 Feature Roadmap

### Current Features (v1.0)
✅ Creator registration & authentication  
✅ Admin approval workflow  
✅ Content upload with verification  
✅ Hash/Text/File/Creator verification  
✅ Content exploration & search  
✅ Admin content moderation  
✅ Version history tracking  
✅ Tamper detection  
✅ Analytics dashboard  

### Planned Features (v2.0)
- 🔄 Real blockchain integration (currently demo mode)
- 🔄 IPFS content storage
- 🔄 NFT certificates for verified content
- 🔄 Multi-signature admin approvals
- 🔄 Advanced analytics
- 🔄 API for third-party integration
- 🔄 Mobile app (React Native)
- 🔄 Browser extension

---

## 📞 Support & Contact

For questions, issues, or contributions:
- **GitHub Issues**: Report bugs or request features
- **Documentation**: Refer to testing and deployment guides
- **Community**: Join discussions and share feedback

---

**Built with ❤️ to fight misinformation**

**TruthChain** - *Because truth matters*

---

*Last Updated: 2025-11-29*  
*Version: 1.0*  
*Maintained by: Development Team*
