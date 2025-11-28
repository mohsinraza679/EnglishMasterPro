# Script to set up Java environment variables for current session
# Run this before building if JAVA_HOME is not set permanently

$javaPath = "C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot"

if (Test-Path $javaPath) {
    Write-Host "✓ Java found at: $javaPath" -ForegroundColor Green
    
    # Set for current session
    $env:JAVA_HOME = $javaPath
    $env:PATH = "$javaPath\bin;$env:PATH"
    
    Write-Host "✓ JAVA_HOME set for this session: $env:JAVA_HOME" -ForegroundColor Green
    
    # Verify Java works
    Write-Host ""
    Write-Host "Verifying Java installation..." -ForegroundColor Yellow
    & "$javaPath\bin\java.exe" -version
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Java is ready for this PowerShell session!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To make this permanent:" -ForegroundColor Yellow
    Write-Host "1. Press Win+R, type: sysdm.cpl" -ForegroundColor White
    Write-Host "2. Advanced → Environment Variables" -ForegroundColor White
    Write-Host "3. Add System Variable:" -ForegroundColor White
    Write-Host "   Name: JAVA_HOME" -ForegroundColor White
    Write-Host "   Value: $javaPath" -ForegroundColor Gray
    Write-Host "4. Edit Path, add: %JAVA_HOME%\bin" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "✗ Java not found at: $javaPath" -ForegroundColor Red
    Write-Host "Please check the installation path." -ForegroundColor Yellow
}

