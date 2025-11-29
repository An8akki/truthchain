# TruthChain Verification Portal - Test Cases

This document outlines the test cases to verify the functionality of the Content Verification Portal.

## 1. Hash Verification

### Case 1.1: Authentic Content (Hash Match)
*   **Method**: Select "Hash"
*   **Input**: `0xabcd1234efgh5678`
*   **Expected Result**:
    *   Status: **Authentic Content** (Blue Shield)
    *   Title: "Breaking: Major Climate Agreement Reached"
    *   Creator: Global News Network
    *   Version: v1

### Case 1.2: Unverified Content (Hash Mismatch)
*   **Method**: Select "Hash"
*   **Input**: `0x1234567890abcdef` (Random hash)
*   **Expected Result**:
    *   Status: **Unverified / No Record** (Red X)
    *   Message: "No record found for this content or hash."

## 2. Text Verification

### Case 2.1: Authentic Text (Direct Match)
*   **Method**: Select "Text"
*   **Input Text**: (Any text that hashes to `0xabcd1234efgh5678` - *Note: Since we are mocking, you can't easily guess the text that produces this hash. For testing "Authentic" via Text, you would need to know the exact text input that generates the mock hash. However, for the purpose of this demo, we can test the "Tampered" state easily.*)

### Case 2.2: Tampered Content Detection (Edited)
*   **Method**: Select "Text"
*   **Input Text**: "This is some fake news article content."
*   **Optional Reference Hash**: `0xabcd1234efgh5678` (The hash of the "Climate Agreement" article)
*   **Expected Result**:
    *   Status: **Content Edited / Tampered** (Yellow Alert)
    *   Computed Hash: (The hash of your input text)
    *   Registered Hash: `0xabcd1234efgh5678`
    *   Message: "The content hash does not match the registered hash."

## 3. File Verification

### Case 3.1: Tampered File Detection
*   **Method**: Select "File"
*   **Input File**: Upload any image or text file (e.g., `report.pdf`)
*   **Optional Reference Hash**: `0xyyyy7890zzzz1234` (The hash of the "Healthcare Revolution" article)
*   **Expected Result**:
    *   Status: **Content Edited / Tampered** (Yellow Alert)
    *   Computed Hash: (The hash of your uploaded file)
    *   Registered Hash: `0xyyyy7890zzzz1234`
    *   Version History: Should show v2 (Current) and v1 (Previous)

## 4. Version History Display

### Case 4.1: Content with History
*   **Method**: Select "Hash"
*   **Input**: `0xyyyy7890zzzz1234`
*   **Expected Result**:
    *   Status: **Authentic Content**
    *   Title: "Healthcare Revolution: AI in Medicine"
    *   Version History Section:
        *   **v2 (Current)** - Green/Blue pill
        *   **v1** - Gray pill

## 5. Creator Verification

### Case 5.1: Verify Creator by Wallet Address
*   **Method**: Select "Creator"
*   **Input**: `0x1234abc567def890` (Global News Network's wallet)
*   **Expected Result**:
    *   Redirects to the creator's profile page
    *   Shows all content published by that creator
    *   Displays creator information and statistics

### Case 5.2: Invalid Creator ID
*   **Method**: Select "Creator"
*   **Input**: `invalid-address` (Not starting with 0x)
*   **Expected Result**:
    *   Error message: "Please enter a valid Creator ID (starting with 0x)"

## 6. Visual Updates

### Case 6.1: Cosmos Background
*   Navigate to **Verify**, **Creator**, and **Explore** pages
*   **Expected Result**:
    *   All three pages should display the cosmos background image
    *   Background should have a transparent dark overlay (60% opacity)
    *   Background should be fixed (doesn't scroll with content)
