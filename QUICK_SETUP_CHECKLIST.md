# Quick Setup Checklist ✅

## What You Have:
- ✅ **Java JDK 17.0.17.10** installed at: `C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot`

## What You Need Next:

### 1. Set JAVA_HOME (Optional but Recommended)
   - Press `Win + R`, type `sysdm.cpl`, press Enter
   - Advanced → Environment Variables
   - Add System Variable:
     - Name: `JAVA_HOME`
     - Value: `C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot`
   - Edit "Path" → Add: `%JAVA_HOME%\bin`
   - **Restart PowerShell** after setting

### 2. Install Android Studio ⚠️ (Required)
   - Download: https://developer.android.com/studio
   - Install it (this includes Android SDK)
   - During installation, make sure "Android SDK" is checked
   - After installation, Android Studio will download SDK components

### 3. Set ANDROID_HOME (After Android Studio Installation)
   - Find your SDK path (usually: `C:\Users\YourName\AppData\Local\Android\Sdk`)
   - Set System Variable:
     - Name: `ANDROID_HOME`
     - Value: `C:\Users\YourName\AppData\Local\Android\Sdk`
   - Add to Path:
     - `%ANDROID_HOME%\platform-tools`
     - `%ANDROID_HOME%\tools`

### 4. Build Your APK
   Once Android Studio is installed, run:
   ```powershell
   .\build-local.ps1
   ```

---

## Quick Test (After Setup)

Run this to check if everything is ready:
```powershell
java -version
echo $env:ANDROID_HOME
adb version
```

If all three commands work, you're ready to build! 🎉

---

## Alternative: Use GitHub Actions (No Local Setup Needed)

If you don't want to install Android Studio, you can:
1. Use the GitHub Actions build (already set up)
2. Download the APK from GitHub Actions
3. Share via WhatsApp

But if you want to build locally, you need Android Studio.

