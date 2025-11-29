# Testing Multi-Creator Functionality

## How to Test Multiple Creators

### Step 1: Create First Creator
1. **Connect MetaMask** with Account 1 (e.g., 0x123...)
2. **Register** with:
   - Name: "Alice Johnson"
   - Email: "alice@example.com"
   - Organization: "News Corp"
   - Password: "alice123"
3. **Logout** (if logged in)

### Step 2: Create Second Creator
1. **Switch MetaMask account** to Account 2 (e.g., 0x456...)
2. **Refresh the page** (important!)
3. **Register** with:
   - Name: "Bob Smith"
   - Email: "bob@example.com"
   - Organization: "Tech Daily"
   - Password: "bob123"
4. **Logout**

### Step 3: Create Third Creator
1. **Switch MetaMask account** to Account 3
2. **Refresh the page**
3. **Register** with different email and credentials
4. **Logout**

### Step 4: Admin Approves All Creators
1. **Go to Admin page** (/admin)
2. **Login** with password: "admin123"
3. **You should see all 3 pending creators**
4. **Click "Approve"** for Alice
   - Alert shows: "Security Key sent to alice@example.com"
   - **Copy the security key** from the alert (e.g., "A7B9C2D4")
   - Check console for email preview
5. **Click "Approve"** for Bob
   - Copy Bob's security key
6. **Click "Approve"** for third creator
   - Copy their security key

### Step 5: Login as Different Creators

**Login as Alice:**
1. **Switch MetaMask** to Account 1
2. **Refresh page**
3. **Click "Login"**
4. Enter:
   - Email/Username: "alice@example.com" (or "Alice Johnson")
   - Password: "alice123"
   - Security Key: [Alice's key from step 4]
5. **Login successful!**
6. Upload content, manage profile
7. **Logout**

**Login as Bob:**
1. **Switch MetaMask** to Account 2
2. **Refresh page**
3. **Click "Login"**
4. Enter:
   - Email/Username: "bob@example.com" (or "Bob Smith")
   - Password: "bob123"
   - Security Key: [Bob's key from step 4]
5. **Login successful!**
6. Upload content (separate from Alice's content)
7. **Logout**

## Important Notes

### ✅ What Works:
- **Multiple creators** with different wallets
- **Each creator has separate content**
- **Each creator has unique security key**
- **Login with email OR username**
- **Independent profiles and stats**

### ⚠️ Current Limitations:
- **No real emails sent** - Security keys shown in alerts only
- **Must copy security key** from alert when admin approves
- **Must switch MetaMask accounts** to test different creators
- **Must refresh page** after switching accounts

### 📝 Security Key Storage:
- **Where to find your security key:**
  1. When admin approves, an **alert popup** shows the key
  2. **Browser console** shows email preview with the key
  3. **Admin page** shows the key next to approved creators
  4. **Copy and save it** - you'll need it to login!

## Common Issues & Solutions

### Issue: "This wallet is already registered"
**Solution:** Switch to a different MetaMask account

### Issue: "This email is already registered"
**Solution:** Use a different email address for each creator

### Issue: "Can't find my security key"
**Solution:** 
1. Go to Admin page
2. Login as admin
3. Scroll to "Verified Creators" section
4. Your security key is displayed there

### Issue: "Login fails with security key"
**Solution:**
1. Make sure you're using the correct MetaMask account
2. Check if your account is approved (Admin page)
3. Copy the exact security key (case-sensitive)
4. Try logging in with email instead of username

## Viewing All Creators (Admin)

1. Go to **/admin** page
2. Login with: "admin123"
3. See sections:
   - **Pending Requests** - Awaiting approval
   - **Verified Creators** - Approved creators with their security keys

## Testing Forgot Password

1. Register a creator
2. Logout
3. Click "Forgot Password?"
4. Enter the registered email
5. Enter new password
6. Login with new password (and security key if approved)

## Next Steps for Real Email Integration

To send actual emails, you'll need:

1. **Backend API** (Node.js/Express)
2. **Email Service** (SendGrid, AWS SES, Mailgun)
3. **API Keys** from email provider
4. **Email Templates** for security keys
5. **Environment Variables** for secure key storage

Would you like me to help set up a backend with real email sending?
