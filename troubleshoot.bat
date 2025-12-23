@echo off
title Scrcpy Troubleshoot - By VAIZBTG

:troubleshoot_menu
cls
echo ===================================
echo  TROUBLESHOOT SCRCPY
echo ===================================
echo 1. Cek Status ADB
echo 2. Cek USB Debugging
echo 3. Test Koneksi Perangkat
echo 4. Cek Versi Scrcpy
echo 5. Reset ADB
echo 6. Cek Port yang Digunakan
echo 7. Log Diagnostik
echo 8. Kembali
echo.
set /p trouble_choice="Pilihan (1-8): "

if "%trouble_choice%"=="1" goto check_adb
if "%trouble_choice%"=="2" goto check_usb_debug
if "%trouble_choice%"=="3" goto test_connection
if "%trouble_choice%"=="4" goto check_version
if "%trouble_choice%"=="5" goto reset_adb
if "%trouble_choice%"=="6" goto check_ports
if "%trouble_choice%"=="7" goto diagnostic_log
if "%trouble_choice%"=="8" exit /b

echo Pilihan tidak valid!
pause
goto troubleshoot_menu

:check_adb
cls
echo === CEK STATUS ADB ===
echo.
echo Versi ADB:
adb version
echo.
echo Status ADB Server:
adb get-state
echo.
echo Perangkat yang terhubung:
adb devices -l
echo.
pause
goto troubleshoot_menu

:check_usb_debug
cls
echo === CEK USB DEBUGGING ===
echo.
echo Langkah-langkah mengaktifkan USB Debugging:
echo 1. Buka Settings di HP Android
echo 2. Cari "About Phone" atau "Tentang Ponsel"
echo 3. Tap "Build Number" 7 kali untuk aktifkan Developer Options
echo 4. Kembali ke Settings, cari "Developer Options"
echo 5. Aktifkan "USB Debugging"
echo 6. Hubungkan HP ke PC dan izinkan debugging
echo.
echo Cek status USB Debugging saat ini:
adb shell settings get global development_settings_enabled
echo (1 = aktif, 0 = tidak aktif)
echo.
pause
goto troubleshoot_menu

:test_connection
cls
echo === TEST KONEKSI PERANGKAT ===
echo.
echo Testing koneksi ke perangkat...
echo.
adb devices
echo.
echo Testing shell access:
adb shell echo "Koneksi berhasil!"
echo.
echo Testing screen capture:
adb shell screencap -p > test_screen.png
if exist test_screen.png (
    echo Screen capture berhasil! File: test_screen.png
    del test_screen.png
) else (
    echo Screen capture gagal!
)
echo.
pause
goto troubleshoot_menu

:check_version
cls
echo === CEK VERSI SCRCPY ===
echo.
echo Versi Scrcpy:
scrcpy --version
echo.
echo Lokasi executable:
where scrcpy
echo.
pause
goto troubleshoot_menu

:reset_adb
cls
echo === RESET ADB ===
echo.
echo Menghentikan ADB server...
adb kill-server
echo.
echo Memulai ulang ADB server...
adb start-server
echo.
echo Mencari perangkat...
adb devices
echo.
echo Reset ADB selesai!
pause
goto troubleshoot_menu

:check_ports
cls
echo === CEK PORT YANG DIGUNAKAN ===
echo.
echo Port ADB yang sedang digunakan:
netstat -an | findstr :5037
echo.
echo Port TCP/IP untuk wireless (jika ada):
netstat -an | findstr :5555
echo.
pause
goto troubleshoot_menu

:diagnostic_log
cls
echo === LOG DIAGNOSTIK ===
echo.
echo Membuat log diagnostik...
echo.
echo === DIAGNOSTIC LOG - %date% %time% === > scrcpy_diagnostic.log
echo. >> scrcpy_diagnostic.log
echo ADB Version: >> scrcpy_diagnostic.log
adb version >> scrcpy_diagnostic.log 2>&1
echo. >> scrcpy_diagnostic.log
echo Scrcpy Version: >> scrcpy_diagnostic.log
scrcpy --version >> scrcpy_diagnostic.log 2>&1
echo. >> scrcpy_diagnostic.log
echo Connected Devices: >> scrcpy_diagnostic.log
adb devices -l >> scrcpy_diagnostic.log 2>&1
echo. >> scrcpy_diagnostic.log
echo ADB Ports: >> scrcpy_diagnostic.log
netstat -an | findstr :5037 >> scrcpy_diagnostic.log 2>&1
echo. >> scrcpy_diagnostic.log

echo Log diagnostik tersimpan di: scrcpy_diagnostic.log
echo.
pause
goto troubleshoot_menu