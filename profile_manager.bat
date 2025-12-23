@echo off
title Scrcpy Profile Manager - By VAIZBTG

:profile_menu
cls
echo ===================================
echo  PROFILE MANAGER SCRCPY
echo ===================================
echo 1. Gaming Mode (Low Latency)
echo 2. Presentation Mode (High Quality)
echo 3. Battery Saver Mode
echo 4. Audio Only Mode
echo 5. Custom Profile
echo 6. Kembali
echo.
set /p profile_choice="Pilihan (1-6): "

if "%profile_choice%"=="1" goto gaming_mode
if "%profile_choice%"=="2" goto presentation_mode
if "%profile_choice%"=="3" goto battery_saver
if "%profile_choice%"=="4" goto audio_only_mode
if "%profile_choice%"=="5" goto custom_profile
if "%profile_choice%"=="6" exit /b

echo Pilihan tidak valid!
pause
goto profile_menu

:gaming_mode
cls
echo === GAMING MODE (LOW LATENCY) ===
echo Mengoptimalkan untuk gaming dengan latensi rendah...
echo.
scrcpy --max-size=1280 --max-fps=60 --video-bit-rate=8M --audio-buffer=20 --render-driver=opengl --no-control
pause
goto profile_menu

:presentation_mode
cls
echo === PRESENTATION MODE (HIGH QUALITY) ===
echo Mengoptimalkan untuk presentasi dengan kualitas tinggi...
echo.
scrcpy --max-fps=30 --video-bit-rate=15M --audio-buffer=100 --render-driver=opengl
pause
goto profile_menu

:battery_saver
cls
echo === BATTERY SAVER MODE ===
echo Mode hemat baterai dengan kualitas rendah...
echo.
scrcpy --max-size=720 --max-fps=15 --video-bit-rate=1M --turn-screen-off --no-audio
pause
goto profile_menu

:audio_only_mode
cls
echo === AUDIO ONLY MODE ===
echo Mode audio saja untuk streaming musik...
echo.
scrcpy --no-video --audio-codec=opus --audio-bit-rate=128k
pause
goto profile_menu

:custom_profile
cls
echo === CUSTOM PROFILE ===
echo Buat pengaturan custom Anda...
echo.
set "custom_options="

set /p max_size="Resolusi maksimal (default: 1024): "
if not "%max_size%"=="" set "custom_options=%custom_options% --max-size=%max_size%"

set /p max_fps="FPS maksimal (default: 30): "
if not "%max_fps%"=="" set "custom_options=%custom_options% --max-fps=%max_fps%"

set /p bitrate="Video bitrate (default: 8M): "
if not "%bitrate%"=="" set "custom_options=%custom_options% --video-bit-rate=%bitrate%"

echo.
echo Menjalankan dengan pengaturan: %custom_options%
scrcpy %custom_options%
pause
goto profile_menu