# Android Development Setup Guide for Windows

## Quick Setup Steps

### Option 1: Automated Setup (Recommended)
Run the setup script I created for you:
```powershell
.\setup-android.ps1
```

### Option 2: Manual Setup

#### Step 1: Install Java JDK (Required)
1. Download JDK 17 from: https://adoptium.net/temurin/releases/?version=17
2. Install it (default location: `C:\Program Files\Eclipse Adoptium\`)
3. Set environment variable:
   - Open System Properties → Environment Variables
   - Add new System Variable:
     - Name: `JAVA_HOME`
     - Value: `C:\Program Files\Eclipse Adoptium\jdk-17.x.x-hotspot` (your actual path)

#### Step 2: Install Android Studio
1. Download from: https://developer.android.com/studio
2. Install Android Studio
3. During installation, make sure to install:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device (optional, for emulator)

#### Step 3: Set Android Environment Variables
After Android Studio installation:
1. Open System Properties → Environment Variables
2. Add new System Variable:
   - Name: `ANDROID_HOME`
   - Value: `C:\Users\YourUsername\AppData\Local\Android\Sdk` (or your SDK path)
3. Edit `Path` variable and add:
   - `%ANDROID_HOME%\platform-tools`
   - `%ANDROID_HOME%\tools`
   - `%ANDROID_HOME%\tools\bin`

#### Step 4: Install Android SDK Components
1. Open Android Studio
2. Go to: Tools → SDK Manager
3. Install:
   - Android SDK Platform 36 (or latest)
   - Android SDK Build-Tools
   - Android SDK Command-line Tools

#### Step 5: Verify Installation
Open a new PowerShell window and run:
```powershell
java -version
adb version
```

#### Step 6: Build Your APK
```powershell
cd android
.\gradlew assembleDebug
```

Your APK will be at: `android\app\build\outputs\apk\debug\app-debug.apk`

---

## Alternative: Use Online Build Service

If you don't want to install everything locally, you can use:
- **EAS Build** (Expo) - but requires converting to Expo
- **GitHub Actions** - automated builds
- **AppCenter** - Microsoft's build service

---

## Troubleshooting

### If gradlew fails:
- Make sure JAVA_HOME is set correctly
- Make sure ANDROID_HOME is set correctly
- Restart your terminal after setting environment variables

### If build fails:
- Run: `cd android && .\gradlew clean`
- Then: `.\gradlew assembleDebug`

