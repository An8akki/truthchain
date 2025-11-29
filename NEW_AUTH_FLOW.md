# New Authentication Flow - Simplified

## Old Flow (Complex - Email Based)
❌ Register → Email → Admin Approves → Email with Security Key → Login with Key

## New Flow (Simple - In-App Notifications)
✅ Register (Username + Password) → Login → See Notification with Security Key → Use Key to Upload

---

## Implementation Changes Needed:

### 1. Remove Email Requirement
- Registration: Only username, password, organization
- No email field needed
- No email validation

### 2. Simplify Login
- Login with: Username + Password only
- No security key needed for login
- User can login even if not approved

### 3. Add Notification System
- After login, show notification banner if approved
- Display: "✅ You're verified! Your Security Key: ABC123"
- User can copy the key from notification

### 4. Lock Upload Feature
- Upload button disabled if not approved
- If approved but no key entered: Show input field
- After entering correct key: Unlock upload permanently for session

### 5. Admin Flow
- Admin approves creator
- Security key generated and stored
- Creator sees key in notification next time they login

---

## User Experience:

### Scenario 1: New User (Not Approved)
```
1. Register with username + password
2. Login successfully
3. See dashboard with message: "⏳ Awaiting admin approval"
4. Upload button is locked/disabled
5. Can view content but cannot upload
```

### Scenario 2: Approved User (First Time)
```
1. Login with username + password
2. See notification: "✅ Verified! Security Key: ABC123"
3. Go to Upload tab
4. See: "Enter your security key to unlock upload"
5. Enter key → Upload unlocked for this session
```

### Scenario 3: Approved User (Returning)
```
1. Login with username + password
2. See notification with security key
3. Go to Upload tab
4. Enter security key (or it's remembered)
5. Upload content
```

---

## Benefits:
✅ No email infrastructure needed
✅ Simpler registration (just username + password)
✅ Easier login (no security key needed)
✅ Security key only for upload (better UX)
✅ In-app notifications (no external dependencies)
✅ Works completely offline/locally
