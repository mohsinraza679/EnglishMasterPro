# Local Build Script for Android APK
# This script helps you build the APK on your local machine

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Local Android APK Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check Java
Write-Host "Checking Java..." -ForegroundColor Yellow

# Try to find Java in common locations if not in PATH
$javaFound = $false
if (-not $env:JAVA_HOME) {
    $javaPaths = @(
        "C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot",
        "C:\Program Files\Eclipse Adoptium\jdk-17*",
        "C:\Program Files\Java\jdk-17*",
        "C:\Program Files (x86)\Java\jdk-17*"
    )
    
    foreach ($pattern in $javaPaths) {
        $found = Get-ChildItem -Path (Split-Path $pattern) -Filter (Split-Path -Leaf $pattern) -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($found -and (Test-Path "$($found.FullName)\bin\java.exe")) {
            $env:JAVA_HOME = $found.FullName
            $env:PATH = "$($found.FullName)\bin;$env:PATH"
            Write-Host "✓ Java found at: $($found.FullName)" -ForegroundColor Green
            $javaFound = $true
            break
        }
    }
}

# Check if Java works now
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    if ($javaVersion -match "version") {
        Write-Host "✓ Java is working: $javaVersion" -ForegroundColor Green
        $javaFound = $true
    }
} catch {
    if (-not $javaFound) {
        Write-Host "✗ Java is NOT installed or not in PATH" -ForegroundColor Red
        Write-Host "  Please install Java JDK 17 from: https://adoptium.net/temurin/releases/?version=17" -ForegroundColor Yellow
        Write-Host "  And set JAVA_HOME environment variable" -ForegroundColor Yellow
        exit 1
    }
}

# Check Android SDK
Write-Host ""
Write-Host "Checking Android SDK..." -ForegroundColor Yellow
$androidHome = $env:ANDROID_HOME
if (-not $androidHome) {
    # Try common locations
    $commonPaths = @(
        "$env:LOCALAPPDATA\Android\Sdk",
        "$env:USERPROFILE\AppData\Local\Android\Sdk",
        "C:\Android\Sdk"
    )

    foreach ($path in $commonPaths) {
        if (Test-Path $path) {
            Write-Host "⚠ Android SDK found at: $path" -ForegroundColor Yellow
            Write-Host "  But ANDROID_HOME is not set!" -ForegroundColor Yellow
            Write-Host "  Setting ANDROID_HOME for this session..." -ForegroundColor Gray
            $env:ANDROID_HOME = $path
            $androidHome = $path
            break
        }
    }
}

if ($androidHome -and (Test-Path $androidHome)) {
    Write-Host "✓ Android SDK found: $androidHome" -ForegroundColor Green
} else {
    Write-Host "✗ Android SDK is NOT found" -ForegroundColor Red
    Write-Host "  Please install Android Studio from: https://developer.android.com/studio" -ForegroundColor Yellow
    Write-Host "  And set ANDROID_HOME environment variable" -ForegroundColor Yellow
    exit 1
}

# Check if we're in the right directory
Write-Host ""
Write-Host "Checking project structure..." -ForegroundColor Yellow
if (-not (Test-Path "android")) {
    Write-Host "✗ 'android' folder not found!" -ForegroundColor Red
    Write-Host "  Make sure you're in the project root directory" -ForegroundColor Yellow
    exit 1
}
Write-Host "✓ Project structure looks good" -ForegroundColor Green

# Check Node modules
Write-Host ""
Write-Host "Checking dependencies..." -ForegroundColor Yellow
if (-not (Test-Path "node_modules")) {
    Write-Host "⚠ node_modules not found. Installing dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ Failed to install dependencies" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "✓ Dependencies installed" -ForegroundColor Green
}

# Build APK
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Building APK..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This may take 5-15 minutes on first build..." -ForegroundColor Yellow
Write-Host ""

$originalDir = Get-Location
try {
    Set-Location android

    # Make gradlew executable (if on WSL/Git Bash)
    if (Test-Path "gradlew") {
        # On Windows, we use gradlew.bat
        Write-Host "Running Gradle build..." -ForegroundColor Yellow
        .\gradlew.bat assembleDebug --no-daemon

        if ($LASTEXITCODE -eq 0) {
            $apkPath = "app\build\outputs\apk\debug\app-debug.apk"
            if (Test-Path $apkPath) {
                Write-Host ""
                Write-Host "========================================" -ForegroundColor Green
                Write-Host "✓ Build Successful!" -ForegroundColor Green
                Write-Host "========================================" -ForegroundColor Green
                Write-Host ""
                $fullPath = (Resolve-Path $apkPath).Path
                Write-Host "APK Location: $fullPath" -ForegroundColor Cyan
                Write-Host ""
                Write-Host "File size: $((Get-Item $apkPath).Length / 1MB) MB" -ForegroundColor Gray
                Write-Host ""
                Write-Host "You can now:" -ForegroundColor Yellow
                Write-Host "1. Share this APK via WhatsApp to your phone" -ForegroundColor White
                Write-Host "2. Install it on your Android device" -ForegroundColor White
                Write-Host "3. Test the app!" -ForegroundColor White
            } else {
                Write-Host "✗ Build completed but APK not found at expected location" -ForegroundColor Red
            }
        } else {
            Write-Host "✗ Build failed. Check the error messages above." -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "✗ gradlew not found in android folder" -ForegroundColor Red
        exit 1
    }
} finally {
    Set-Location $originalDir
}

