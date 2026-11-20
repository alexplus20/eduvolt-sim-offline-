@echo off
echo Building EduVolt SIM Offline Windows Installer (.msi / .exe)...
where cargo >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Rust/Cargo is not installed. Install from https://rustup.rs/
    pause
    exit /b 1
)
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js/npm is not installed. Install from https://nodejs.org/
    pause
    exit /b 1
)
if not exist "node_modules" (
    npm install --no-audit --no-fund @tauri-apps/cli@2
)
npx tauri build
echo Done! Check src-tauri\target\release\bundle\ for installer files.
pause