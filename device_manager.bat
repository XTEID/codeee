@echo off
title Scrcpy Device Manager - By VAIZBTG

:device_menu
cls
echo ===================================
echo  DEVICE MANAGER SCRCPY
echo ===================================
echo.
echo Mencari perangkat yang terhubung...
adb devices
echo.
echo 1. Pilih perangkat secara manual
echo 2. Mirror semua perangkat sekaligus
echo 3. Informasi perangkat detail
echo 4. Restart ADB Server
echo 5. Kembali
echo.
set /p device_choice="Pilihan (1-5): "

if "%device_choice%"=="1" goto select_device
if "%device_choice%"=="2" goto mirror_all
if "%device_choice%"=="3" goto device_info
if "%device_choice%"=="4" goto restart_adb
if "%device_choice%"=="5" exit /b

echo Pilihan tidak valid!
pause
goto device_menu

:select_device
cls
echo === PILIH PERANGKAT ===
echo.
echo Daftar perangkat:
adb devices
echo.
set /p device_id="Masukkan Device ID: "
if "%device_id%"=="" (
    echo Device ID tidak boleh kosong!
    pause
    goto device_menu
)

echo.
echo Menjalankan scrcpy untuk device: %device_id%
scrcpy --serial=%device_id%
pause
goto device_menu

:mirror_all
cls
echo === MIRROR SEMUA PERANGKAT ===
echo.
echo Memulai mirror untuk semua perangkat yang terhubung...
echo Setiap perangkat akan dibuka di window terpisah.
echo.

for /f "skip=1 tokens=1" %%i in ('adb devices') do (
    if not "%%i"=="" (
        echo Memulai scrcpy untuk device: %%i
        start "Scrcpy - %%i" scrcpy --serial=%%i --window-title="%%i"
        timeout /t 2 /nobreak >nul
    )
)

echo.
echo Semua perangkat telah dimulai!
pause
goto device_menu

:device_info
cls
echo === INFORMASI PERANGKAT ===
echo.
set /p device_id="Masukkan Device ID untuk info detail: "
if "%device_id%"=="" (
    echo Device ID tidak boleh kosong!
    pause
    goto device_menu
)

echo.
echo === Informasi Device: %device_id% ===
echo.
echo Model:
adb -s %device_id% shell getprop ro.product.model
echo.
echo Android Version:
adb -s %device_id% shell getprop ro.build.version.release
echo.
echo Screen Resolution:
adb -s %device_id% shell wm size
echo.
echo Battery Level:
adb -s %device_id% shell dumpsys battery | findstr level
echo.
pause
goto device_menu

:restart_adb
cls
echo === RESTART ADB SERVER ===
echo.
echo Menghentikan ADB server...
adb kill-server
echo.
echo Memulai ADB server...
adb start-server
echo.
echo ADB server telah direstart!
pause
goto device_menu