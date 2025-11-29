# TruthChain - Visual Test Checklist ✓

## 🎯 Quick Visual Verification (5 Minutes)

### Step 1: Initial Setup ✓
- [ ] Server running at `http://localhost:3000`
- [ ] MetaMask installed and unlocked
- [ ] Browser console open (F12)
- [ ] Run: `localStorage.clear()` in console

---

## 🔄 Core Functionality Flow Test

### Flow 1: Creator Registration → Upload → Verify (Complete Journey)

#### Part A: Registration (2 min)
- [ ] Navigate to `/creator`
- [ ] Click "Connect Wallet" → Approve MetaMask
- [ ] See registration form
- [ ] Enter:
  - Name: `Test User`
  - Organization: `Test Org`
  - Password: `test123`
- [ ] Click "Register"
- [ ] ✅ See success message: "Registration successful! Awaiting verification"
- [ ] ✅ Profile shows "Awaiting Verification" badge

#### Part B: Admin Approval (1 min)
- [ ] Navigate to `/admin`
- [ ] ✅ See "Test User" in Pending Creators list
- [ ] Click "Approve" button
- [ ] ✅ Status changes to "Approved" (green badge)
- [ ] ✅ Security key generated (12 characters shown)
- [ ] Copy the security key

#### Part C: Login & Unlock (1 min)
- [ ] Go back to `/creator`
- [ ] Click "Logout" if logged in
- [ ] Click "Already registered? Login"
- [ ] Enter username: `Test User`, password: `test123`
- [ ] Click "Login"
- [ ] ✅ Dashboard loads
- [ ] ✅ Profile shows "Verified Creator" badge
- [ ] Click "Inbox" icon (bell)
- [ ] ✅ See security key message
- [ ] Click "Upload" tab
- [ ] ✅ See "Unlock Upload Feature" section
- [ ] Paste security key
- [ ] Click "Unlock"
- [ ] ✅ Upload form becomes accessible

#### Part D: Upload Content (2 min)
- [ ] Fill upload form:
  - Title: `My First Article`
  - Description: `This is a test article`
  - Content: `Hello World! This is my verified content.`
  - Type: `article`
  - Origin Proof: `https://example.com/source`
- [ ] Click "Upload Content"
- [ ] ✅ See verification animation (4 steps):
  1. "Analyzing document metadata..."
  2. "Verifying digital signatures..."
  3. "Cross-referencing origin source..."
  4. "Validating content integrity..."
- [ ] ✅ Success message: "Proof Verified & Content Published to Blockchain!"
- [ ] ✅ Automatically switches to "My Content" tab
- [ ] ✅ Content appears with:
  - Title: "My First Article"
  - Hash: `0x...` (starts with 0x)
  - Version: `v1`
  - Timestamp: Current time
  - Edit and Delete buttons visible

#### Part E: Verify Content (1 min)
- [ ] Copy the hash from "My Content"
- [ ] Navigate to `/verify`
- [ ] Select "Hash" method
- [ ] Paste the hash
- [ ] Click "Verify Content"
- [ ] ✅ Blue shield icon appears
- [ ] ✅ Status: "Authentic Content"
- [ ] ✅ Shows correct title: "My First Article"
- [ ] ✅ Shows creator name: "Test User"
- [ ] ✅ Shows timestamp
- [ ] ✅ Shows version: v1

#### Part F: Explore Page (1 min)
- [ ] Navigate to `/explore`
- [ ] ✅ See your article in the grid
- [ ] ✅ See 5 mock articles (total 6 items)
- [ ] Search for "My First Article"
- [ ] ✅ Only your article shows
- [ ] Click on your article card
- [ ] ✅ Modal opens with full content
- [ ] ✅ Shows complete article text
- [ ] ✅ Shows hash, creator, timestamp
- [ ] Click X to close modal

---

## 🧪 Advanced Feature Tests

### Test 2: Content Editing & Version History (3 min)

- [ ] Go to `/creator` → "My Content"
- [ ] Click "Edit" on "My First Article"
- [ ] ✅ Upload form pre-fills with existing data
- [ ] Change title to: `My Updated Article`
- [ ] Change content to: `Hello World! This is UPDATED content.`
- [ ] Click "Upload Content"
- [ ] ✅ Verification animation plays
- [ ] ✅ Success: "Content Updated Successfully!"
- [ ] ✅ Version shows: `v2`
- [ ] ✅ New hash generated (different from v1)
- [ ] Go to `/verify`
- [ ] Verify the OLD hash (v1)
- [ ] ✅ Still shows as "Authentic" but with old title
- [ ] Verify the NEW hash (v2)
- [ ] ✅ Shows "Authentic" with updated title
- [ ] ✅ Version history shows: v2 (Current), v1

### Test 3: Tamper Detection (2 min)

- [ ] Go to `/verify`
- [ ] Select "Text" method
- [ ] Paste: `This is fake content`
- [ ] Copy your article's hash (v2) into "Verify against specific Hash" field
- [ ] Click "Verify Content"
- [ ] ✅ Yellow alert icon appears
- [ ] ✅ Status: "Content Edited / Tampered"
- [ ] ✅ Shows "Computed Hash" (from fake text)
- [ ] ✅ Shows "Registered Hash" (your real hash)
- [ ] ✅ Both hashes are different (proves tampering)

### Test 4: File Upload Verification (2 min)

- [ ] Create a simple text file: `test.txt` with content "Test File"
- [ ] Go to `/verify`
- [ ] Select "File" method
- [ ] Click upload area
- [ ] Select `test.txt`
- [ ] ✅ File name displays: "test.txt"
- [ ] Click "Verify Content"
- [ ] ✅ Hash computed from file binary
- [ ] ✅ Shows verification result (likely "Unverified" since file not uploaded)

### Test 5: Creator Verification (1 min)

- [ ] Go to `/verify`
- [ ] Select "Creator" method
- [ ] Enter: `0x1234abc567def890`
- [ ] Click "Verify Content"
- [ ] ✅ Redirects to `/profile/0x1234abc567def890`

### Test 6: Admin Content Management (2 min)

- [ ] Go to `/admin`
- [ ] Click "All Content" tab
- [ ] ✅ See "My Updated Article" in list
- [ ] Click "Block" button
- [ ] ✅ Status changes to "Blocked"
- [ ] Go to `/explore`
- [ ] ✅ Article is hidden from grid
- [ ] Back to `/admin`
- [ ] Click "Unblock"
- [ ] ✅ Status changes back to normal
- [ ] Go to `/explore`
- [ ] ✅ Article reappears

### Test 7: Multiple Creators (3 min)

- [ ] Logout from current creator
- [ ] Switch to different MetaMask account
- [ ] Register as "Creator Two" with password "pass456"
- [ ] Admin approves "Creator Two"
- [ ] Login as "Creator Two"
- [ ] Unlock upload with security key
- [ ] Upload article: "Second Creator Article"
- [ ] Go to `/explore`
- [ ] ✅ See articles from both creators
- [ ] Filter by creator name in search
- [ ] ✅ Can filter by each creator

### Test 8: Search & Filter (2 min)

- [ ] Go to `/explore`
- [ ] Search: "Climate"
- [ ] ✅ Shows "Breaking: Major Climate Agreement Reached"
- [ ] Clear search
- [ ] Filter: "news"
- [ ] ✅ Shows only news articles
- [ ] Filter: "article"
- [ ] ✅ Shows only articles
- [ ] Search: "Tech" + Filter: "report"
- [ ] ✅ Shows "Tech Innovation Report 2025"

### Test 9: Data Persistence (1 min)

- [ ] Refresh the page (F5)
- [ ] ✅ Content still in Explore
- [ ] Go to `/creator` (need to login again)
- [ ] Login with credentials
- [ ] ✅ "My Content" still shows uploaded articles
- [ ] Go to `/admin`
- [ ] ✅ Approved creators still show as approved

### Test 10: Analytics (1 min)

- [ ] Go to `/creator` → "Analytics" tab
- [ ] ✅ See upload count chart
- [ ] ✅ Chart shows dates and counts
- [ ] ✅ Profile stats show correct upload count
- [ ] ✅ Reputation score calculated correctly

---

## 🎨 Visual Design Checks

### Cosmos Background ✓
- [ ] Navigate to `/verify`
- [ ] ✅ Cosmos background visible
- [ ] ✅ Dark overlay (60% opacity)
- [ ] ✅ Background is fixed (doesn't scroll)
- [ ] Navigate to `/creator`
- [ ] ✅ Cosmos background visible
- [ ] Navigate to `/explore`
- [ ] ✅ Cosmos background visible

### UI Elements ✓
- [ ] All buttons have hover effects
- [ ] Input fields have focus states
- [ ] Cards have hover elevation
- [ ] Icons are properly aligned
- [ ] Text is readable on all backgrounds
- [ ] Colors match theme (green: #00ff41, blue: #007aff, yellow: #ffd700, red: #ff3b30)

---

## 🐛 Error Handling Checks

### Test Invalid Inputs ✓

- [ ] Try to register with empty name
- [ ] ✅ Error: "Please fill in all fields"
- [ ] Try to login with wrong password
- [ ] ✅ Error: "Invalid password"
- [ ] Try to upload without title
- [ ] ✅ Error: "Please fill in all required fields"
- [ ] Try to upload without origin proof
- [ ] ✅ Error: "Origin Proof is required"
- [ ] Try to verify empty hash
- [ ] ✅ Error: "Please enter a Content Hash"
- [ ] Try creator verification with invalid address
- [ ] ✅ Error: "Please enter a valid Creator ID (starting with 0x)"

---

## 📊 Final Checklist

### Core Features Working ✓
- [ ] ✅ Creator registration
- [ ] ✅ Admin approval
- [ ] ✅ Security key system
- [ ] ✅ Content upload
- [ ] ✅ Content editing
- [ ] ✅ Version history
- [ ] ✅ Hash verification
- [ ] ✅ Tamper detection
- [ ] ✅ Content exploration
- [ ] ✅ Search & filter
- [ ] ✅ Admin moderation

### Data Interlinking ✓
- [ ] ✅ Creator Portal → Explore (content appears)
- [ ] ✅ Creator Portal → Verify (hash works)
- [ ] ✅ Creator Portal → Admin (manageable)
- [ ] ✅ Admin → Explore (blocking works)
- [ ] ✅ Verify → Explore (same data)

### Dynamic Updates ✓
- [ ] ✅ Upload → Immediate Explore update
- [ ] ✅ Edit → Version increments
- [ ] ✅ Block → Explore hides
- [ ] ✅ Unblock → Explore shows
- [ ] ✅ Approve → Inbox notification

### Performance ✓
- [ ] ✅ Page loads < 2 seconds
- [ ] ✅ Verification animation smooth
- [ ] ✅ No console errors
- [ ] ✅ LocalStorage under 1MB

---

## 🎯 Success Criteria

### ✅ ALL TESTS PASS IF:
1. Complete creator journey works end-to-end
2. Content uploads and appears in all relevant pages
3. Hash verification returns correct results
4. Tamper detection identifies modified content
5. Version history tracks all changes
6. Admin controls affect content visibility
7. Data persists after refresh
8. All backgrounds show cosmos theme
9. No console errors
10. All interlinking works correctly

---

## 📝 Test Results

**Date:** _________________
**Tester:** _________________
**Browser:** _________________

**Overall Result:** ✅ PASS / ❌ FAIL

**Notes:**
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________

**Issues Found:**
_________________________________________________________________
_________________________________________________________________
_________________________________________________________________
