# TruthChain - Fixes Required

## Issue 1: Profile Stats Not Updating After Publishing Content

### Problem
The Total Uploads and Reputation Score remain at 0 even after publishing content.

### Root Cause
The profile stats update logic in the `useEffect` hook checks `if (profile)` before updating, but the profile might not be set yet when content is loaded.

### Solution
Add a separate `useEffect` that watches for changes in `myContent.length` and updates the profile stats:

```typescript
// Add this new useEffect after the existing one (around line 123)
useEffect(() => {
    if (profile && myContent.length >= 0) {
        const newReputation = Math.min(5.0, myContent.length * 0.1 + 3.0);
        setProfile(prev => prev ? ({
            ...prev,
            totalUploads: myContent.length,
            reputationScore: parseFloat(newReputation.toFixed(1))
        }) : null);
    }
}, [myContent.length]);
```

Also change the initial reputation score from 0 to 3.0 on line 96:
```typescript
reputationScore: 3.0,  // Changed from 0
```

## Issue 2: Creator Login/Registration Flow

### Current State
- New creators can register but there's no login mechanism
- Existing creators need to re-register each time

### Solution
Add a login/registration toggle in the registration view. Store creator credentials in localStorage with their wallet address as the key.

### Implementation
1. Add state for login mode:
```typescript
const [isLoginMode, setIsLoginMode] = useState(false);
const [password, setPassword] = useState("");
```

2. Modify the registration view to include:
   - Toggle between "Register" and "Login" modes
   - Password field for authentication
   - Store credentials: `localStorage.setItem(`creator_${account}`, JSON.stringify({name, organization, password}))`
   - On login: verify password matches stored credentials

## Issue 3: Admin Password Authentication

### Current State
Admin page is accessible without authentication

### Solution
Add password check before allowing access to admin features.

### Implementation
1. In `frontend/app/admin/page.tsx`, add password state:
```typescript
const [adminPassword, setAdminPassword] = useState("");
const [isAuthenticated, setIsAuthenticated] = useState(false);
const ADMIN_PASSWORD = "admin123"; // In production, use environment variable
```

2. Show password input before displaying admin content:
```typescript
if (!isAuthenticated) {
    return (
        // Password input form
        // On submit: if (adminPassword === ADMIN_PASSWORD) setIsAuthenticated(true)
    );
}
```

## Quick Fix Instructions

Since the file keeps getting corrupted during edits, here's the manual approach:

1. **For Profile Stats**: 
   - Open `frontend/app/creator/page.tsx`
   - Find line 96, change `reputationScore: 0` to `reputationScore: 3.0`
   - Add the new useEffect hook after line 123

2. **For Creator Login**:
   - This requires more extensive changes
   - Consider implementing in a future update

3. **For Admin Password**:
   - Open `frontend/app/admin/page.tsx`
   - Add password check at the beginning of the component
   - Only render admin content if password is correct

Would you like me to implement any of these fixes one at a time to avoid file corruption?
