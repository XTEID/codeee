@echo off
title Scrcpy Screen Recorder - By VAIZBTG

:record_menu
cls
echo ===================================
echo  PEREKAM LAYAR SCRCPY
echo ===================================
echo 1. Rekam dengan Audio
echo 2. Rekam Tanpa Audio  
echo 3. Rekam dengan Kualitas Tinggi
echo 4. Rekam dengan Kualitas Rendah (Hemat Space)
echo 5. Kembali
echo.
set /p record_choice="Pilihan (1-5): "

if "%record_choice%"=="1" goto record_with_audio
if "%record_choice%"=="2" goto record_no_audio
if "%record_choice%"=="3" goto record_high_quality
if "%record_choice%"=="4" goto record_low_quality
if "%record_choice%"=="5" exit /b

echo Pilihan tidak valid!
pause
goto record_menu

:record_with_audio
cls
echo === PEREKAMAN DENGAN AUDIO ===
set /p filename="Nama file (tanpa ekstensi): "
if "%filename%"=="" set filename=recording_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
echo.
echo Memulai perekaman: %filename%.mkv
echo Tekan Ctrl+C untuk menghentikan perekaman
scrcpy --record=%filename%.mkv
pause
goto record_menu

:record_no_audio
cls
echo === PEREKAMAN TANPA AUDIO ===
set /p filename="Nama file (tanpa ekstensi): "
if "%filename%"=="" set filename=recording_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
echo.
echo Memulai perekaman: %filename%.mp4
echo Tekan Ctrl+C untuk menghentikan perekaman
scrcpy --record=%filename%.mp4 --no-audio
pause
goto record_menu

:record_high_quality
cls
echo === PEREKAMAN KUALITAS TINGGI ===
set /p filename="Nama file (tanpa ekstensi): "
if "%filename%"=="" set filename=hq_recording_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
echo.
echo Memulai perekaman kualitas tinggi: %filename%.mkv
echo Tekan Ctrl+C untuk menghentikan perekaman
scrcpy --record=%filename%.mkv --video-bit-rate=20M --max-fps=60
pause
goto record_menu

:record_low_quality
cls
echo === PEREKAMAN KUALITAS RENDAH ===
set /p filename="Nama file (tanpa ekstensi): "
if "%filename%"=="" set filename=lq_recording_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
echo.
echo Memulai perekaman kualitas rendah: %filename%.mp4
echo Tekan Ctrl+C untuk menghentikan perekaman
scrcpy --record=%filename%.mp4 --max-size=720 --video-bit-rate=2M --max-fps=30 --no-audio
pause
goto record_menu