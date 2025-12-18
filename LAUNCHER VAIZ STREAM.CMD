@echo off
setlocal enabledelayedexpansion
title Scrcpy Launcher Pro - VAIZBTG

:: Menentukan lokasi scrcpy.exe di folder yang sama dengan file .bat
set "SC_PATH=%~dp0scrcpy.exe"

:menu
cls
echo ===================================
echo   SCRCPY LAUNCHER - BY VAIZBTG
echo ===================================
echo Lokasi: "%~dp0"
echo -----------------------------------
echo 1. Full Mode (USB + Video + Audio)
echo 2. Hanya Audio (Tanpa Video)
echo 3. Mode Ringan (Video Tanpa Audio)
echo 4. Keluar
echo.
set /p choice="Masukkan pilihan (1-4): "

if "%choice%"=="1" goto usb
if "%choice%"=="2" goto audio_only
if "%choice%"=="3" goto no_audio
if "%choice%"=="4" exit
goto menu

:usb
set "opts="
set /p m_size="1. Resolusi (Contoh 800, 1024. Kosongkan untuk default): "
if not "%m_size%"=="" set opts=%opts% --max-size=%m_size%

set /p m_fps="2. Max FPS (Contoh 30, 60): "
if not "%m_fps%"=="" set opts=%opts% --max-fps=%m_fps%

goto run_scrcpy

:audio_only
set "opts=--no-video"
goto run_scrcpy

:no_audio
set "opts=--no-audio"
set /p m_size="Resolusi Video (Contoh 800, 1024): "
if not "%m_size%"=="" set opts=%opts% --max-size=%m_size%
goto run_scrcpy

:run_scrcpy
cls
echo ===================================
echo   SEDANG MENJALANKAN SCRCPY...
echo ===================================
echo.
echo Perintah: "%SC_PATH%" %opts%
echo.

:: Eksekusi dengan tanda kutip ganda untuk menangani spasi folder
"%SC_PATH%" %opts%

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Terjadi kesalahan!
    echo 1. Pastikan HP sudah terhubung via USB.
    echo 2. Pastikan USB Debugging di HP sudah aktif.
    echo 3. Kode Error: %errorlevel%
)
echo.
echo Tekan tombol apa saja untuk kembali ke menu...
pause >nul
goto menu