# Local Build Setup Guide for Windows

## Quick Setup (Step by Step)

### Step 1: Install Java JDK 17

1. **Download Java JDK 17:**
   - Go to: https://adoptium.net/temurin/releases/?version=17
   - Download Windows x64 installer (`.msi` file)
   - Run the installer
   - **Important:** Note the installation path (usually: `C:\Program Files\Eclipse Adoptium\jdk-17.x.x-hotspot`)

2. **Set JAVA_HOME Environment Variable:**
   - Press `Win + R`, type `sysdm.cpl`, press Enter
   - Go to "Advanced" tab → Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `JAVA_HOME`
   - Variable value: `C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot` (your actual path)
   - Click OK

3. **Add Java to PATH:**
   - In Environment Variables, find "Path" in System variables
   - Click "Edit"
   - Click "New"
   - Add: `%JAVA_HOME%\bin`
   - Click OK on all windows

4. **Verify Installation:**
   - Open a NEW PowerShell window
   - Run: `java -version`
   - You should see Java version 17

---

### Step 2: Install Android Studio

1. **Download Android Studio:**
   - Go to: https://developer.android.com/studio
   - Click "Download Android Studio"
   - Run the installer

2. **During Installation:**
   - Choose "Standard" installation
   - Make sure "Android SDK" is checked
   - Make sure "Android SDK Platform" is checked
   - Make sure "Android Virtual Device" is checked (optional, for emulator)

3. **After Installation:**
   - Android Studio will open
   - It will download additional components (this takes time)
   - Wait for "SDK Manager" to finish

4. **Find Your SDK Path:**
   - In Android Studio: File → Settings → Appearance & Behavior → System Settings → Android SDK
   - Note the "Android SDK Location" (usually: `C:\Users\YourName\AppData\Local\Android\Sdk`)

---

### Step 3: Set Android Environment Variables

1. **Set ANDROID_HOME:**
   - Press `Win + R`, type `sysdm.cpl`, press Enter
   - Go to "Advanced" tab → Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\YourName\AppData\Local\Android\Sdk` (your actual path)
   - Click OK

2. **Add Android Tools to PATH:**
   - In Environment Variables, find "Path" in System variables
   - Click "Edit"
   - Add these three entries (click "New" for each):
     - `%ANDROID_HOME%\platform-tools`
     - `%ANDROID_HOME%\tools`
     - `%ANDROID_HOME%\tools\bin`
   - Click OK on all windows

3. **Verify Installation:**
   - **Close all PowerShell/Command Prompt windows**
   - Open a NEW PowerShell window
   - Run: `adb version`
   - You should see Android Debug Bridge version

---

### Step 4: Install Required Android SDK Components

1. **Open Android Studio**
2. **Go to:** Tools → SDK Manager
3. **In "SDK Platforms" tab:**
   - Check "Android 14.0 (API 34)" or latest
   - Check "Show Package Details"
   - Make sure "Android SDK Platform 36" (or latest) is checked
4. **In "SDK Tools" tab:**
   - Check "Android SDK Build-Tools"
   - Check "Android SDK Command-line Tools"
   - Check "Android SDK Platform-Tools"
   - Check "NDK (Side by side)" - latest version
5. **Click "Apply"** and wait for installation

---

### Step 5: Build Your APK Locally

1. **Open PowerShell in your project folder:**
   ```powershell
   cd D:\laragon\www\EnglishMasterPro
   ```

2. **Install Node dependencies (if not done):**
   ```powershell
   npm install
   ```

3. **Build the APK:**
   ```powershell
   cd android
   .\gradlew assembleDebug
   ```

4. **Your APK will be at:**
   ```
   android\app\build\outputs\apk\debug\app-debug.apk
   ```

---

## Quick Verification Commands

After setup, run these in a NEW PowerShell window:

```powershell
# Check Java
java -version

# Check Android SDK
echo $env:ANDROID_HOME

# Check ADB
adb version

# Check if everything is ready
cd D:\laragon\www\EnglishMasterPro
cd android
.\gradlew --version
```

---

## Troubleshooting

### "java: command not found"
- Make sure JAVA_HOME is set correctly
- Make sure `%JAVA_HOME%\bin` is in PATH
- **Restart PowerShell/Command Prompt**

### "gradlew: command not found" or permission errors
- Make sure you're in the `android` folder
- Try: `.\gradlew.bat assembleDebug` (Windows)

### "ANDROID_HOME not set"
- Make sure you set the environment variable
- **Restart PowerShell/Command Prompt** after setting variables
- Verify with: `echo $env:ANDROID_HOME`

### Build fails with SDK errors
- Open Android Studio
- Go to SDK Manager
- Install missing SDK components
- Make sure API Level 36 (or latest) is installed

### Build is slow
- First build takes 10-15 minutes (downloads dependencies)
- Subsequent builds are faster (2-5 minutes)

---

## Alternative: Use Pre-built Script

I've created a helper script. After installing Java and Android Studio, run:
```powershell
.\build-local.ps1
```

This will check your setup and build the APK automatically.

