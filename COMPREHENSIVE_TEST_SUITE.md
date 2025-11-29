# TruthChain - Comprehensive Test Suite (50+ Test Cases)

## Test Environment Setup
- Browser: Chrome/Firefox (Latest)
- MetaMask: Installed and configured
- Local Server: Running on `http://localhost:3000`
- Clear localStorage before starting: `localStorage.clear()`

---

## 1. Navigation & UI Tests (5 Tests)

### TC-001: Navigation Bar Visibility
**Steps:**
1. Open homepage
2. Check navigation bar

**Expected:** Navigation shows "TruthChain" logo, Home, Verify, Explore, Creator, Admin links

### TC-002: Wallet Connection Button
**Steps:**
1. Click "Connect Wallet" button
2. Approve MetaMask connection

**Expected:** Button changes to show wallet address (truncated)

### TC-003: Page Navigation
**Steps:**
1. Click each navigation link (Home, Verify, Explore, Creator, Admin)

**Expected:** Each page loads with correct cosmos background and content

### TC-004: Responsive Background
**Steps:**
1. Navigate to Verify, Creator, Explore pages
2. Scroll down

**Expected:** Cosmos background is fixed (parallax effect)

### TC-005: Mobile Responsiveness
**Steps:**
1. Resize browser to mobile width (375px)
2. Check all pages

**Expected:** Content adapts to mobile view, navigation collapses

---

## 2. Creator Registration & Authentication (10 Tests)

### TC-006: Creator Registration - Valid Data
**Steps:**
1. Connect wallet
2. Go to Creator Portal
3. Enter: Name="John Doe", Organization="News Corp", Password="test123"
4. Click Register

**Expected:** Success message, status shows "Awaiting verification"

### TC-007: Creator Registration - Duplicate Username
**Steps:**
1. Register with username "John Doe"
2. Disconnect wallet, connect different wallet
3. Try to register again with "John Doe"

**Expected:** Error: "This username is already taken"

### TC-008: Creator Registration - Duplicate Wallet
**Steps:**
1. Register with a wallet
2. Logout
3. Try to register again with same wallet

**Expected:** Error: "Wallet already registered to [username]"

### TC-009: Creator Registration - Empty Fields
**Steps:**
1. Leave Name field empty
2. Click Register

**Expected:** Error: "Please fill in all fields"

### TC-010: Creator Login - Valid Credentials
**Steps:**
1. Register as "John Doe" with password "test123"
2. Logout
3. Click "Already registered? Login"
4. Enter username and password
5. Click Login

**Expected:** Success, dashboard loads showing profile

### TC-011: Creator Login - Invalid Password
**Steps:**
1. Enter correct username, wrong password
2. Click Login

**Expected:** Error: "Invalid password"

### TC-012: Creator Login - Non-existent User
**Steps:**
1. Enter username that doesn't exist
2. Click Login

**Expected:** Error: "No account found"

### TC-013: Password Reset
**Steps:**
1. Click "Forgot Password?"
2. Enter username "John Doe"
3. Enter new password "newpass123"
4. Click Reset

**Expected:** Success message, can login with new password

### TC-014: Creator Logout
**Steps:**
1. Login as creator
2. Click Logout button

**Expected:** Returns to login screen, session cleared

### TC-015: Persistent Login
**Steps:**
1. Login as creator
2. Refresh page

**Expected:** Still shows login screen (requires re-login for security)

---

## 3. Admin Verification Workflow (8 Tests)

### TC-016: Admin Access
**Steps:**
1. Navigate to `/admin`
2. Check page loads

**Expected:** Admin dashboard visible with pending creators list

### TC-017: View Pending Creators
**Steps:**
1. Register 3 creators
2. Go to Admin page

**Expected:** All 3 creators show in "Pending" tab with status "pending"

### TC-018: Approve Creator
**Steps:**
1. Register creator "John Doe"
2. Go to Admin page
3. Click "Approve" on John Doe
4. Check Inbox notification

**Expected:** 
- Status changes to "approved"
- Security key generated (12-char alphanumeric)
- Creator receives inbox message with security key

### TC-019: Reject Creator
**Steps:**
1. Register creator "Jane Smith"
2. Go to Admin, click "Reject"

**Expected:** Status changes to "rejected", no security key

### TC-020: Security Key Generation
**Steps:**
1. Approve a creator
2. Check the security key format

**Expected:** Key is 12 characters, alphanumeric (e.g., "a1b2c3d4e5f6")

### TC-021: Admin Content Management
**Steps:**
1. Creator publishes content
2. Admin views content in "All Content" tab

**Expected:** Content shows with creator name, title, hash, timestamp

### TC-022: Block Content
**Steps:**
1. Admin clicks "Block" on a content item
2. Check Explore page

**Expected:** Content marked as blocked, hidden from Explore

### TC-023: Unblock Content
**Steps:**
1. Block a content item
2. Click "Unblock"

**Expected:** Content visible again in Explore

---

## 4. Creator Content Upload (10 Tests)

### TC-024: Upload Content - Not Verified
**Steps:**
1. Register but don't get admin approval
2. Try to upload content

**Expected:** Error: "You must be a verified creator to upload content"

### TC-025: Unlock Upload Feature
**Steps:**
1. Get approved by admin
2. Check inbox for security key
3. Go to Upload tab
4. Enter security key
5. Click Unlock

**Expected:** Upload form becomes accessible

### TC-026: Upload Content - Valid Data
**Steps:**
1. Unlock upload
2. Fill: Title="Breaking News", Description="Important update", Content="Full article text", Type="news", Origin Proof="https://source.com/article"
3. Click Upload

**Expected:** 
- Verification animation shows 4 steps
- Success message appears
- Switches to "My Content" tab
- Content appears in list

### TC-027: Upload Content - Missing Fields
**Steps:**
1. Leave Title empty
2. Click Upload

**Expected:** Error: "Please fill in all required fields"

### TC-028: Upload Content - Missing Origin Proof
**Steps:**
1. Fill all fields except Origin Proof
2. Click Upload

**Expected:** Error: "Origin Proof is required to verify authenticity"

### TC-029: Content Hash Generation
**Steps:**
1. Upload content with text "Hello World"
2. Check generated hash

**Expected:** Hash starts with "0x" and is consistent for same content

### TC-030: View My Content
**Steps:**
1. Upload 3 different articles
2. Go to "My Content" tab

**Expected:** All 3 articles listed with title, hash, timestamp, version

### TC-031: Edit Content
**Steps:**
1. Upload content
2. Click "Edit" button
3. Modify title to "Updated Title"
4. Click Upload

**Expected:** 
- Version increments to v2
- New hash generated
- Old version saved in history
- Success: "Content Updated Successfully!"

### TC-032: Delete Content
**Steps:**
1. Upload content
2. Click "Delete"
3. Confirm deletion

**Expected:** Content removed from "My Content" and Explore

### TC-033: Content Version History
**Steps:**
1. Upload content (v1)
2. Edit content (v2)
3. Edit again (v3)
4. Check history

**Expected:** History shows v1, v2 with timestamps and hashes

---

## 5. Explore Page & Content Discovery (8 Tests)

### TC-034: View All Content
**Steps:**
1. Upload 5 different content items from different creators
2. Go to Explore page

**Expected:** All 5 items visible + 5 mock items = 10 total

### TC-035: Search by Title
**Steps:**
1. In search box, type "Climate"
2. Press Enter

**Expected:** Only "Breaking: Major Climate Agreement Reached" shows

### TC-036: Search by Creator Name
**Steps:**
1. Search for "Global News Network"

**Expected:** Shows all content by that creator

### TC-037: Search by Wallet Address
**Steps:**
1. Search for "0x1234abc567def890"

**Expected:** Shows content from that wallet

### TC-038: Filter by Content Type
**Steps:**
1. Select "news" from filter dropdown

**Expected:** Only news articles displayed

### TC-039: Filter + Search Combination
**Steps:**
1. Search "Tech"
2. Filter by "report"

**Expected:** Only "Tech Innovation Report 2025" shows

### TC-040: View Content Details
**Steps:**
1. Click on any content card

**Expected:** Modal opens showing full content, description, hash, creator info, timestamp

### TC-041: Close Content Modal
**Steps:**
1. Open content details
2. Click X button or outside modal

**Expected:** Modal closes, returns to Explore grid

---

## 6. Verification Portal (12 Tests)

### TC-042: Verify by Hash - Authentic
**Steps:**
1. Select "Hash" method
2. Enter: `0xabcd1234efgh5678`
3. Click Verify

**Expected:** 
- Blue shield icon
- Status: "Authentic Content"
- Shows: Title, Creator, Timestamp, Version

### TC-043: Verify by Hash - Unverified
**Steps:**
1. Enter random hash: `0x9999999999999999`
2. Click Verify

**Expected:** 
- Red X icon
- Status: "Unverified / No Record"

### TC-044: Verify by Text - Authentic
**Steps:**
1. Select "Text" method
2. Upload content with text "Hello World"
3. Copy the generated hash
4. Go to Verify, select "Text"
5. Paste "Hello World"
6. Click Verify

**Expected:** Status: "Authentic Content" (hash matches)

### TC-045: Verify by Text - Tampered
**Steps:**
1. Select "Text" method
2. Paste text: "This is fake news"
3. In "Verify against specific Hash" field, enter: `0xabcd1234efgh5678`
4. Click Verify

**Expected:** 
- Yellow alert icon
- Status: "Content Edited / Tampered"
- Shows both computed hash and registered hash

### TC-046: Verify by File - Upload
**Steps:**
1. Select "File" method
2. Click upload area
3. Select an image file
4. Click Verify

**Expected:** 
- File name displays
- Hash computed from file binary
- Shows verification result

### TC-047: Verify by File - Tampered
**Steps:**
1. Upload a file
2. In reference hash field, enter a different hash
3. Click Verify

**Expected:** Status: "Content Edited / Tampered"

### TC-048: Verify by Creator - Valid
**Steps:**
1. Select "Creator" method
2. Enter: `0x1234abc567def890`
3. Click Verify

**Expected:** Redirects to `/profile/0x1234abc567def890`

### TC-049: Verify by Creator - Invalid Format
**Steps:**
1. Select "Creator"
2. Enter: "invalid-address"
3. Click Verify

**Expected:** Error: "Please enter a valid Creator ID (starting with 0x)"

### TC-050: Hash Comparison Display
**Steps:**
1. Verify tampered content
2. Check result display

**Expected:** 
- "Computed Hash" shows in white
- "Registered Hash" shows in yellow/blue
- Both hashes visible side-by-side

### TC-051: Version History Display
**Steps:**
1. Verify hash: `0xyyyy7890zzzz1234`

**Expected:** 
- Shows v2 (Current) in blue pill
- Shows v1 in gray pill

### TC-052: Empty Hash Input
**Steps:**
1. Select "Hash"
2. Leave field empty
3. Click Verify

**Expected:** Error: "Please enter a Content Hash"

### TC-053: Empty Text Input
**Steps:**
1. Select "Text"
2. Leave textarea empty
3. Click Verify

**Expected:** Error: "Please enter text to verify"

---

## 7. Data Persistence & LocalStorage (5 Tests)

### TC-054: Content Persists After Refresh
**Steps:**
1. Upload content
2. Refresh page
3. Check "My Content"

**Expected:** Content still visible

### TC-055: Creator Credentials Persist
**Steps:**
1. Register as creator
2. Close browser
3. Reopen, connect same wallet

**Expected:** Shows login screen (requires re-login)

### TC-056: Admin Approvals Persist
**Steps:**
1. Admin approves creator
2. Refresh admin page

**Expected:** Creator still shows as "approved"

### TC-057: Inbox Messages Persist
**Steps:**
1. Receive security key in inbox
2. Refresh page

**Expected:** Message still in inbox

### TC-058: Upload Unlock Status Persists
**Steps:**
1. Unlock upload with security key
2. Refresh page

**Expected:** Upload still unlocked (no need to re-enter key)

---

## 8. Edge Cases & Error Handling (5 Tests)

### TC-059: Multiple Wallets Same Browser
**Steps:**
1. Register with Wallet A
2. Switch to Wallet B in MetaMask
3. Try to access creator dashboard

**Expected:** Shows registration screen for Wallet B

### TC-060: Very Long Content
**Steps:**
1. Upload content with 10,000 characters

**Expected:** Uploads successfully, hash generated correctly

### TC-061: Special Characters in Content
**Steps:**
1. Upload content with emojis, symbols: "Test 🚀 @#$%"

**Expected:** Handles correctly, hash generated

### TC-062: Concurrent Edits
**Steps:**
1. Edit content, don't save
2. Open in another tab, edit and save
3. Save first tab

**Expected:** Latest edit wins, version increments correctly

### TC-063: Network Disconnection
**Steps:**
1. Disconnect MetaMask
2. Try to upload content

**Expected:** Shows "Connect Wallet" message

---

## 9. Analytics & Statistics (3 Tests)

### TC-064: Creator Upload Count
**Steps:**
1. Upload 5 articles
2. Check profile stats

**Expected:** "Total Uploads" shows 5

### TC-065: Reputation Score Calculation
**Steps:**
1. Upload 10 articles
2. Check reputation

**Expected:** Score increases (formula: min(5.0, uploads * 0.1 + 3.0))

### TC-066: Analytics Chart
**Steps:**
1. Upload content on different days
2. Go to Analytics tab

**Expected:** Line chart shows upload trends over time

---

## 10. Integration Tests (5 Tests)

### TC-067: Full Creator Journey
**Steps:**
1. Register → Admin approves → Receive key → Unlock upload → Upload content → View in Explore → Verify hash

**Expected:** All steps work seamlessly

### TC-068: Content Update Flow
**Steps:**
1. Upload → Edit → Verify old hash (should show v1) → Verify new hash (should show v2)

**Expected:** Version history tracked correctly

### TC-069: Multi-Creator Scenario
**Steps:**
1. Register 3 creators
2. Each uploads 2 articles
3. Check Explore page

**Expected:** 6 articles from 3 different creators visible

### TC-070: Admin Content Moderation Flow
**Steps:**
1. Creator uploads content → Admin blocks it → Check Explore (hidden) → Admin unblocks → Check Explore (visible)

**Expected:** Content visibility controlled by admin

### TC-071: Cross-Page Data Consistency
**Steps:**
1. Upload content in Creator Portal
2. Check same content in Explore
3. Verify hash in Verify page
4. Check in Admin panel

**Expected:** Same data (title, hash, creator) across all pages

---

## Summary

**Total Test Cases: 71**

### Coverage:
- ✅ Navigation & UI: 5 tests
- ✅ Authentication: 10 tests
- ✅ Admin Workflow: 8 tests
- ✅ Content Upload: 10 tests
- ✅ Content Discovery: 8 tests
- ✅ Verification: 12 tests
- ✅ Data Persistence: 5 tests
- ✅ Edge Cases: 5 tests
- ✅ Analytics: 3 tests
- ✅ Integration: 5 tests

### Test Execution Priority:
1. **Critical Path (P0):** TC-067, TC-071 (End-to-end flows)
2. **High Priority (P1):** TC-006-015, TC-024-033 (Core features)
3. **Medium Priority (P2):** TC-034-053 (Feature validation)
4. **Low Priority (P3):** TC-059-066 (Edge cases)

### Expected Results:
- All core functionality should work
- Data should persist across page refreshes
- All pages should be interlinked correctly
- Verification should match uploaded content
- Admin controls should affect content visibility
