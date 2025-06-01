@echo off
cd /d %~dp0

:: بررسی نصب بودن git
where git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Git نصب نشده! لطفاً از این لینک نصبش کن: https://git-scm.com/download/win
    pause
    exit /b
)

:: ست کردن اسم و ایمیل گیت (می‌تونی ایمیل خودتو بزنی)
git config --global user.name "warmulti"
git config --global user.email "warmulti@example.com"

:: حذف origin قبلی در صورت وجود
git remote remove origin 2>nul

:: ست کردن remote جدید
git remote add origin https://github.com/warmulti/sibdns.git

:: سوییچ به برنچ main
git checkout -b main 2>nul

:: اضافه کردن همه فایل‌ها و کامیت
git add .
git commit -m "Initial commit from Windows .bat script"

:: پوش کردن به گیت‌هاب
git push -u origin main

pause