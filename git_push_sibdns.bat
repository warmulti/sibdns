@echo off
:: تغییر مسیر به جایی که فایل bat قرار داره
cd /d %~dp0

:: بررسی نصب بودن git
where git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Git نصب نشده! لطفاً اول از اینجا نصبش کن: https://git-scm.com/download/win
    pause
    exit /b
)

:: اجرای دستورات گیت
git init
git remote add origin https://github.com/warmulti/sibdns.git
git checkout -b main
git add .
git commit -m "Initial commit from zip upload"
git push -u origin main

pause