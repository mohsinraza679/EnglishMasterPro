# How to Build Your Android APK

You have **3 options** to build your APK. Choose the easiest one for you:

---

## Option 1: GitHub Actions (Easiest - No Setup Required!) ⭐

**This is the easiest way - no installation needed on your computer!**

1. **Push your code to GitHub** (you already have the remote set up)
   ```powershell
   git add .
   git commit -m "Add welcome app"
   git push origin main
   ```

2. **Go to your GitHub repository**: https://github.com/mohsinraza679/EnglishMasterPro

3. **Click on "Actions" tab** at the top

4. **Click "Build Android APK"** workflow on the left

5. **Click "Run workflow"** button (on the right)

6. **Wait for the build to complete** (takes 5-10 minutes)

7. **Download the APK**:
   - Click on the completed workflow run
   - Scroll down to "Artifacts"
   - Download `app-debug-apk`
   - Extract the ZIP file to get `app-debug.apk`

**That's it!** No Android Studio or SDK installation needed!

---

## Option 2: Local Setup (If you want to build on your computer)

### Quick Setup:
1. **Run the diagnostic script:**
   ```powershell
   .\setup-android.ps1
   ```
   This will tell you what's missing.

2. **Install Java JDK 17:**
   - Download: https://adoptium.net/temurin/releases/?version=17
   - Install it
   - Set `JAVA_HOME` environment variable

3. **Install Android Studio:**
   - Download: https://developer.android.com/studio
   - Install it (this includes Android SDK)
   - Set `ANDROID_HOME` environment variable to: `C:\Users\YourName\AppData\Local\Android\Sdk`

4. **Add to PATH:**
   - Add `%ANDROID_HOME%\platform-tools` to your system PATH

5. **Restart PowerShell** and build:
   ```powershell
   cd android
   .\gradlew assembleDebug
   ```

See `SETUP_GUIDE.md` for detailed instructions.

---

## Option 3: Use Expo (Alternative - Requires Code Changes)

If you want a simpler setup, you could convert to Expo, but this requires changing your project structure.

---

## Recommended: Use Option 1 (GitHub Actions)

It's the fastest way to get your APK without installing anything!

Just push your code and click a button on GitHub. The APK will be built automatically in the cloud.

---

## Testing the APK on Your Phone

1. Transfer the APK file to your Android phone
2. On your phone, go to Settings → Security
3. Enable "Install from Unknown Sources" or "Install Unknown Apps"
4. Open the APK file and install it
5. Open "English Master Pro" app

---

## Need Help?

- Check `SETUP_GUIDE.md` for detailed setup instructions
- Run `.\setup-android.ps1` to diagnose your setup
- The GitHub Actions workflow is already configured - just push and use it!

