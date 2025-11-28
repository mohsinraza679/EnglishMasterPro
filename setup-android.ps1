# Android Development Environment Setup Script for Windows
# This script helps you set up Android development tools

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Android Development Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Java is installed
Write-Host "Checking for Java JDK..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    if ($javaVersion -match "version") {
        Write-Host "✓ Java is installed: $javaVersion" -ForegroundColor Green
    }
} catch {
    Write-Host "✗ Java JDK is NOT installed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Java JDK 17:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://adoptium.net/temurin/releases/?version=17" -ForegroundColor White
    Write-Host "2. Install it" -ForegroundColor White
    Write-Host "3. Set JAVA_HOME environment variable to the JDK installation path" -ForegroundColor White
    Write-Host "   Example: C:\Program Files\Eclipse Adoptium\jdk-17.x.x-hotspot" -ForegroundColor Gray
    Write-Host ""
}

# Check for Android SDK
Write-Host ""
Write-Host "Checking for Android SDK..." -ForegroundColor Yellow
$androidHome = $env:ANDROID_HOME
$commonPaths = @(
    "$env:LOCALAPPDATA\Android\Sdk",
    "$env:USERPROFILE\AppData\Local\Android\Sdk",
    "C:\Android\Sdk"
)

$sdkFound = $false
if ($androidHome -and (Test-Path $androidHome)) {
    Write-Host "✓ ANDROID_HOME is set: $androidHome" -ForegroundColor Green
    $sdkFound = $true
} else {
    foreach ($path in $commonPaths) {
        if (Test-Path $path) {
            Write-Host "✓ Android SDK found at: $path" -ForegroundColor Green
            Write-Host "  But ANDROID_HOME is not set!" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "To set ANDROID_HOME:" -ForegroundColor Yellow
            Write-Host "1. Open System Properties → Environment Variables" -ForegroundColor White
            Write-Host "2. Add new System Variable:" -ForegroundColor White
            Write-Host "   Name: ANDROID_HOME" -ForegroundColor White
            Write-Host "   Value: $path" -ForegroundColor Gray
            Write-Host "3. Add to Path: %ANDROID_HOME%\platform-tools" -ForegroundColor White
            $sdkFound = $true
            break
        }
    }

    if (-not $sdkFound) {
        Write-Host "✗ Android SDK is NOT installed" -ForegroundColor Red
        Write-Host ""
        Write-Host "Please install Android Studio:" -ForegroundColor Yellow
        Write-Host "1. Download from: https://developer.android.com/studio" -ForegroundColor White
        Write-Host "2. Install Android Studio" -ForegroundColor White
        Write-Host "3. During setup, install Android SDK" -ForegroundColor White
        Write-Host "4. Set ANDROID_HOME environment variable" -ForegroundColor White
    }
}

# Check for ADB
Write-Host ""
Write-Host "Checking for ADB (Android Debug Bridge)..." -ForegroundColor Yellow
try {
    $adbVersion = adb version 2>&1 | Select-Object -First 1
    if ($adbVersion -match "Android Debug Bridge") {
        Write-Host "✓ ADB is available" -ForegroundColor Green
    }
} catch {
    Write-Host "✗ ADB is NOT in PATH" -ForegroundColor Red
    Write-Host "  Make sure %ANDROID_HOME%\platform-tools is in your PATH" -ForegroundColor Yellow
}

# Summary
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setup Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

if ($sdkFound) {
    Write-Host ""
    Write-Host "Next steps to build your APK:" -ForegroundColor Green
    Write-Host "1. Make sure all environment variables are set" -ForegroundColor White
    Write-Host "2. Open a NEW PowerShell window (to reload env vars)" -ForegroundColor White
    Write-Host "3. Run: cd android" -ForegroundColor White
    Write-Host "4. Run: .\gradlew assembleDebug" -ForegroundColor White
    Write-Host ""
    Write-Host "Your APK will be at: android\app\build\outputs\apk\debug\app-debug.apk" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "Please complete the setup steps above, then run this script again." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "For detailed instructions, see SETUP_GUIDE.md" -ForegroundColor Gray
Write-Host ""

