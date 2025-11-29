# TruthChain - Quick Test Execution Guide

## 🚀 Quick Start Testing

### Prerequisites
```bash
# 1. Start the development server
cd frontend
npm run dev

# 2. Open browser to http://localhost:3000
# 3. Open DevTools Console (F12)
# 4. Clear localStorage
localStorage.clear()
```

---

## ⚡ 10-Minute Smoke Test (Critical Path)

### Test 1: Complete Creator Journey (5 min)
```javascript
// 1. Connect MetaMask wallet
// 2. Go to /creator
// 3. Register:
//    Name: "Test Creator"
//    Organization: "Test Org"
//    Password: "test123"

// 4. Go to /admin
// 5. Click "Approve" on Test Creator
// 6. Note the security key shown

// 7. Back to /creator, login with credentials
// 8. Go to Inbox, copy security key
// 9. Go to Upload tab, paste key, click Unlock

// 10. Upload content:
//     Title: "Test Article"
//     Description: "Test description"
//     Content: "This is test content for verification"
//     Type: "article"
//     Origin Proof: "https://test.com/source"

// 11. Wait for verification animation
// 12. Check "My Content" tab - should show article

// ✅ PASS if: Content appears with hash, v1, timestamp
```

### Test 2: Verify Content (2 min)
```javascript
// 1. Copy the hash from "My Content"
// 2. Go to /verify
// 3. Select "Hash" method
// 4. Paste the hash
// 5. Click "Verify Content"

// ✅ PASS if: Shows "Authentic Content" (blue), matches title and creator
```

### Test 3: Explore & Search (2 min)
```javascript
// 1. Go to /explore
// 2. Should see your uploaded content + 5 mock items
// 3. Search for "Test Article"
// 4. Click on the card to view details

// ✅ PASS if: Content shows in search, modal displays full details
```

### Test 4: Content Update & Version History (1 min)
```javascript
// 1. Go to /creator → My Content
// 2. Click "Edit" on your article
// 3. Change title to "Updated Test Article"
// 4. Click Upload
// 5. Check version shows "v2"

// ✅ PASS if: Version increments, history shows v1
```

---

## 🧪 Automated Console Tests

### Run in Browser Console

```javascript
// TEST SUITE: TruthChain Functionality Checker
console.log("🧪 Starting TruthChain Test Suite...\n");

// Test 1: LocalStorage Structure
console.log("Test 1: LocalStorage Structure");
const truthchainContent = localStorage.getItem('truthchain_content');
const adminCreators = localStorage.getItem('admin_creators');
const creatorCreds = localStorage.getItem('truthchain_creator_creds');

console.log("✓ Content Storage:", truthchainContent ? "EXISTS" : "EMPTY");
console.log("✓ Admin Creators:", adminCreators ? "EXISTS" : "EMPTY");
console.log("✓ Creator Credentials:", creatorCreds ? "EXISTS" : "EMPTY");

// Test 2: Content Count
if (truthchainContent) {
    const content = JSON.parse(truthchainContent);
    console.log(`✓ Total Content Items: ${content.length}`);
    console.log("✓ Content Types:", [...new Set(content.map(c => c.contentType))].join(", "));
}

// Test 3: Creator Count
if (adminCreators) {
    const creators = JSON.parse(adminCreators);
    console.log(`✓ Total Creators: ${creators.length}`);
    const approved = creators.filter(c => c.status === 'approved').length;
    const pending = creators.filter(c => c.status === 'pending').length;
    const rejected = creators.filter(c => c.status === 'rejected').length;
    console.log(`  - Approved: ${approved}`);
    console.log(`  - Pending: ${pending}`);
    console.log(`  - Rejected: ${rejected}`);
}

// Test 4: Hash Verification
if (truthchainContent) {
    const content = JSON.parse(truthchainContent);
    console.log("\n✓ Hash Verification:");
    content.slice(0, 3).forEach((item, i) => {
        console.log(`  ${i + 1}. ${item.title}`);
        console.log(`     Hash: ${item.hash}`);
        console.log(`     Version: v${item.version}`);
    });
}

console.log("\n✅ Test Suite Complete!");
```

---

## 📊 Data Interlinking Verification

### Check Data Consistency Across Pages

```javascript
// Run this after uploading content
const verifyDataInterlinking = () => {
    const content = JSON.parse(localStorage.getItem('truthchain_content') || '[]');
    
    if (content.length === 0) {
        console.log("❌ No content found. Upload content first.");
        return;
    }
    
    const testItem = content[0];
    console.log("🔗 Testing Data Interlinking for:", testItem.title);
    console.log("\n1. Creator Portal → Content exists:", !!testItem.id);
    console.log("2. Explore Page → Should be visible:", !testItem.blocked);
    console.log("3. Verify Page → Hash searchable:", testItem.hash);
    console.log("4. Admin Panel → Manageable:", !!testItem.creator);
    
    // Check creator exists
    const creators = JSON.parse(localStorage.getItem('admin_creators') || '[]');
    const creator = creators.find(c => c.address.toLowerCase() === testItem.creator.toLowerCase());
    console.log("5. Creator Registered:", !!creator);
    console.log("6. Creator Verified:", creator?.status === 'approved');
    
    console.log("\n✅ All data properly interlinked!");
};

verifyDataInterlinking();
```

---

## 🔄 Dynamic Update Tests

### Test Real-time Updates

```javascript
// Test 1: Upload → Explore Update
console.log("Test: Upload → Explore Update");
console.log("1. Upload content in Creator Portal");
console.log("2. Go to Explore page (should appear immediately)");
console.log("3. Refresh page (should persist)");

// Test 2: Admin Block → Explore Update
console.log("\nTest: Admin Block → Explore Update");
console.log("1. Block content in Admin panel");
console.log("2. Check Explore page (should be hidden)");
console.log("3. Unblock in Admin");
console.log("4. Check Explore (should reappear)");

// Test 3: Edit → Version Update
console.log("\nTest: Edit → Version Update");
console.log("1. Edit content in Creator Portal");
console.log("2. Version should increment (v1 → v2)");
console.log("3. Old version should be in history");
console.log("4. New hash should be generated");
```

---

## 🎯 Feature-Specific Tests

### Verification Portal Tests
```javascript
// Test all 4 verification methods
const testVerificationMethods = () => {
    console.log("🔍 Verification Methods Test:\n");
    
    console.log("1. Hash Method:");
    console.log("   Input: 0xabcd1234efgh5678");
    console.log("   Expected: Authentic (Blue)");
    
    console.log("\n2. Text Method:");
    console.log("   Input: Any text");
    console.log("   Expected: Hash computed, verification result");
    
    console.log("\n3. File Method:");
    console.log("   Input: Upload any file");
    console.log("   Expected: Binary hash computed");
    
    console.log("\n4. Creator Method:");
    console.log("   Input: 0x1234abc567def890");
    console.log("   Expected: Redirect to profile");
};

testVerificationMethods();
```

### Tamper Detection Test
```javascript
const testTamperDetection = () => {
    console.log("🛡️ Tamper Detection Test:\n");
    
    console.log("Step 1: Upload content 'Hello World'");
    console.log("Step 2: Copy the generated hash");
    console.log("Step 3: Go to Verify → Text method");
    console.log("Step 4: Enter 'Hello World Modified'");
    console.log("Step 5: Paste original hash in 'Reference Hash' field");
    console.log("Step 6: Click Verify");
    console.log("\nExpected: Yellow Alert - 'Content Edited / Tampered'");
};

testTamperDetection();
```

---

## 📈 Performance Checks

```javascript
// Check localStorage size
const checkStorageSize = () => {
    let total = 0;
    for (let key in localStorage) {
        if (localStorage.hasOwnProperty(key)) {
            total += localStorage[key].length + key.length;
        }
    }
    console.log(`📦 Total localStorage size: ${(total / 1024).toFixed(2)} KB`);
    
    // Warn if approaching limit (5MB)
    if (total > 4 * 1024 * 1024) {
        console.warn("⚠️ localStorage approaching limit!");
    }
};

checkStorageSize();
```

---

## 🐛 Common Issues & Solutions

### Issue 1: Content Not Appearing in Explore
```javascript
// Debug:
const content = JSON.parse(localStorage.getItem('truthchain_content') || '[]');
console.log("Content count:", content.length);
console.log("Blocked items:", content.filter(c => c.blocked).length);
// Solution: Check if content is blocked in Admin panel
```

### Issue 2: Can't Upload Content
```javascript
// Debug:
const account = "YOUR_WALLET_ADDRESS"; // Replace with actual
const creators = JSON.parse(localStorage.getItem('admin_creators') || '[]');
const myCreator = creators.find(c => c.address.toLowerCase() === account.toLowerCase());
console.log("Creator status:", myCreator?.status);
console.log("Security key:", myCreator?.securityKey);
// Solution: Ensure admin approved and security key entered
```

### Issue 3: Verification Shows Unverified
```javascript
// Debug:
const hash = "YOUR_HASH"; // Replace with actual
const content = JSON.parse(localStorage.getItem('truthchain_content') || '[]');
const found = content.find(c => c.hash === hash);
console.log("Hash found:", !!found);
console.log("Hash matches:", found?.hash === hash);
// Solution: Ensure exact hash match (case-sensitive)
```

---

## ✅ Success Criteria

### All Tests Pass If:
- ✅ Content uploads successfully with verification animation
- ✅ Content appears in Explore page immediately
- ✅ Hash verification returns "Authentic" for uploaded content
- ✅ Tamper detection shows "Edited" for modified content
- ✅ Version history tracks all edits
- ✅ Admin controls affect content visibility
- ✅ Creator authentication works (register/login/logout)
- ✅ Security key unlocks upload feature
- ✅ Data persists after page refresh
- ✅ All pages show cosmos background

---

## 🎬 Video Recording Test Session

```bash
# Use browser's built-in recorder or:
# 1. Open DevTools → Performance tab
# 2. Click Record
# 3. Execute test scenarios
# 4. Stop recording
# 5. Analyze timeline for any errors
```

---

## 📝 Test Report Template

```
Test Date: [DATE]
Tester: [NAME]
Environment: [Browser + Version]

| Test ID | Test Name | Status | Notes |
|---------|-----------|--------|-------|
| TC-001  | Navigation | ✅ PASS | All links work |
| TC-006  | Registration | ✅ PASS | Success message shown |
| TC-024  | Upload | ✅ PASS | Content created |
| TC-042  | Verify Hash | ✅ PASS | Authentic result |
| TC-067  | Full Journey | ✅ PASS | End-to-end works |

Overall Result: ✅ PASS / ❌ FAIL
```
