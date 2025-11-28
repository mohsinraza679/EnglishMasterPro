# Quick Guide: Build APK and Share via WhatsApp 📱

## Method 1: GitHub Actions (Recommended - No Installation Needed) ⭐

### Step 1: Push Code to GitHub
```powershell
git add .
git commit -m "Ready to build"
git push origin main
```

### Step 2: Build APK on GitHub
1. Go to: **https://github.com/mohsinraza679/EnglishMasterPro**
2. Click **"Actions"** tab (top menu)
3. Click **"Build Android APK"** (left sidebar)
4. Click **"Run workflow"** button (right side)
5. Click green **"Run workflow"** button
6. Wait 5-10 minutes for build to complete

### Step 3: Download APK
1. Click on the completed workflow run (yellow/orange dot will turn green ✓)
2. Scroll down to **"Artifacts"** section
3. Click **"app-debug-apk"** to download
4. Extract the ZIP file
5. You'll get `app-debug.apk`

### Step 4: Share via WhatsApp
1. Open WhatsApp on your computer
2. Send the `app-debug.apk` file to yourself (or your phone number)
3. On your phone, open WhatsApp and download the file
4. Install the APK:
   - Go to Settings → Security → Enable "Install from Unknown Sources"
   - Tap the downloaded APK file
   - Install and open "English Master Pro"

---

## Method 2: Build Locally (If you want to try)

If you want to build on your computer, you need:
1. Java JDK 17
2. Android SDK

Run this to check what you have:
```powershell
.\setup-android.ps1
```

Then follow the instructions it gives you.

---

## Quick Steps Summary:
1. ✅ Code is ready (welcome app created)
2. ⏳ Push to GitHub → Build on GitHub Actions
3. ⏳ Download APK from GitHub
4. ⏳ Share APK via WhatsApp to your phone
5. ⏳ Install and test!

**Total time: ~10 minutes (mostly waiting for GitHub to build)**

