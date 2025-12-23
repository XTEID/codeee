@echo off
title Scrcpy Wireless Setup - By VAIZBTG

echo ===================================
echo  SETUP KONEKSI WIRELESS SCRCPY
echo ===================================
echo.
echo Langkah-langkah:
echo 1. Pastikan HP dan PC terhubung ke WiFi yang sama
echo 2. Aktifkan USB Debugging di HP
echo 3. Hubungkan HP ke PC via USB terlebih dahulu
echo.

echo Mencari perangkat yang terhubung...
adb devices

echo.
set /p device_ip="Masukkan IP Address HP (contoh: 192.168.1.100): "
if "%device_ip%"=="" (
    echo IP Address tidak boleh kosong!
    pause
    exit /b
)

echo.
echo Mengaktifkan ADB over TCP/IP...
adb tcpip 5555

echo.
echo Menunggu 3 detik...
timeout /t 3 /nobreak >nul

echo.
echo Menghubungkan ke %device_ip%:5555...
adb connect %device_ip%:5555

echo.
echo Status koneksi:
adb devices

echo.
echo Setup selesai! Sekarang Anda bisa cabut kabel USB.
echo Gunakan launcher utama untuk memulai scrcpy wireless.
pause