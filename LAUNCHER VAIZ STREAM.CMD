@echo off
title Scrcpy Launcher - By VAIZBTG

:menu
cls
echo ===================================
echo  SCRCPY LAUNCHER SEDERHANA
echo  Dibuat oleh: VAIZBTG
echo ===================================
echo Pilih metode koneksi:
echo 1. Menggunakan USB (dengan opsi video)
echo 2. Hanya Audio (Tanpa Video)
echo 3. Keluar
echo.
set /p choice="Masukkan pilihan Anda (1-3): "

if "%choice%"=="1" goto usb
if "%choice%"=="2" goto audio_only
if "%choice%"=="3" goto exit_app

echo Pilihan tidak valid. Tekan tombol apa saja untuk mencoba lagi.
pause >nul
goto menu

:usb
cls
echo ===================================
echo --- Menjalankan Scrcpy melalui USB ---
echo         (Launcher by VAIZBTG)
echo ===================================
echo.
echo    Untuk mengurangi beban kinerja HP, Anda bisa mengatur parameter berikut:
echo    (Biarkan kosong untuk menggunakan nilai default Scrcpy atau setting asli HP)
echo.

rem --- AWAS: JIKA scrcpy.exe TIDAK ADA DI PATH, ANDA MUNGKIN PERLU MEMBERIKAN PATH LENGKAP ---
rem Contoh: set "scrcpy_command=C:\Program Files\scrcpy\scrcpy.exe"
set "scrcpy_command=scrcpy"
set "scrcpy_options="

set /p max_size_value="1. Resolusi Maksimal Layar (mis: 1024, 800. Default: asli HP): "
if not "%max_size_value%"=="" set "scrcpy_options=%scrcpy_options% --max-size=%max_size_value%"

set /p max_fps_value="2. FPS Maksimal (mis: 15, 20, 30. Default: asli HP): "
if not "%max_fps_value%"=="" set "scrcpy_options=%scrcpy_options% --max-fps=%max_fps_value%"

echo.
echo    Pilih Render Driver Grafis:
echo    1. Default Scrcpy (Biarkan Scrcpy yang memilih)
echo    2. OpenGL (Umum, seringkali terbaik)
echo    3. OpenGL ES 2.0 (Untuk kompatibilitas grafis yang lebih luas)
echo    4. Direct3D (Khusus sistem Windows)
echo    5. Software (Paling kompatibel, namun bisa lebih lambat)
echo.
set "render_driver_value="
set /p render_choice="3. Pilihan Render Driver Anda (1-5, kosongkan untuk Default): "

if "%render_choice%"=="1" set "render_driver_value="
if "%render_choice%"=="2" set "render_driver_value=opengl"
if "%render_choice%"=="3" set "render_driver_value=opengles2"
if "%render_choice%"=="4" set "render_driver_value=direct3d"
if "%render_choice%"=="5" set "render_driver_value=software"

if not "%render_driver_value%"=="" (
    set "scrcpy_options=%scrcpy_options% --render-driver=%render_driver_value%"
) else if not "%render_choice%"=="" if not "%render_choice%"=="1" (
    echo Pilihan Render Driver tidak valid, akan menggunakan Default Scrcpy.
    pause
)

echo.
echo    Opsi Pengaturan Audio Buffer:
echo    Semakin kecil nilai (ms), semakin rendah latensi, tapi risiko putus-putus lebih tinggi.
echo    Default Scrcpy adalah 50.
set /p audio_buffer_value="4. Ukuran Audio Buffer (ms, mis: 20, 50, 100. Default: 50ms): "
if not "%audio_buffer_value%"=="" (
    set "scrcpy_options=%scrcpy_options% --audio-buffer=%audio_buffer_value%"
) else (
    rem Set default 50ms jika kosong
    set "scrcpy_options=%scrcpy_options% --audio-buffer=50"
)

echo.
echo === MEMERIKSA PERINTAH YANG AKAN DIJALANKAN ===
echo Perintah Lengkap:
echo "%scrcpy_command% %scrcpy_options%"
echo (Salin perintah di atas dan coba jalankan manual di CMD jika ada masalah)
echo =============================================
echo.
echo DEBUG: Akan menjalankan Scrcpy sekarang...
echo.

rem --- Coba jalankan scrcpy ---
"%scrcpy_command%" %scrcpy_options%

echo.
echo DEBUG: Scrcpy selesai atau gagal. Errorlevel: %errorlevel%
echo.
echo =================================================================
echo Scrcpy telah selesai atau ditutup (atau mungkin tidak berjalan).
echo Periksa output di atas, terutama Errorlevel.
echo Jika Errorlevel 9009, scrcpy.exe tidak ditemukan.
echo Jika Errorlevel 0 tapi tidak ada tampilan, pastikan HP terhubung dan ADB aktif.
echo Jika ada masalah rendering, coba ganti pilihan Render Driver atau Audio Buffer.
echo Jendela ini akan tetap terbuka. Tekan tombol apa saja untuk kembali ke menu utama.
echo =================================================================
pause
goto menu

:audio_only
cls
echo ===================================
echo --- Menjalankan Scrcpy Mode Audio Saja ---
echo         (Launcher by VAIZBTG)
echo ===================================
echo.
rem --- AWAS: JIKA scrcpy.exe TIDAK ADA DI PATH, ANDA MUNGKIN PERLU MEMBERIKAN PATH LENGKAP ---
rem Contoh: set "scrcpy_command=C:\Program Files\scrcpy\scrcpy.exe"
set "scrcpy_command=scrcpy"
set "scrcpy_options=--no-video"

set /p audio_codec_input="Pilih Audio Codec (aac, opus, raw. Default: opus): "
if not "%audio_codec_input%"=="" set "scrcpy_options=%scrcpy_options% --audio-codec=%audio_codec_input%"

set /p audio_bitrate_input="Masukkan audio bitrate (mis: 64k, 128k. Default Scrcpy: 128k): "
if not "%audio_bitrate_input%"=="" set "scrcpy_options=%scrcpy_options% --audio-bit-rate=%audio_bitrate_input%"

echo.
echo    Opsi Pengaturan Audio Buffer:
echo    Semakin kecil nilai (ms), semakin rendah latensi, tapi risiko putus-putus lebih tinggi.
echo    Default Scrcpy adalah 50.
set /p audio_buffer_value="Ukuran Audio Buffer (ms, mis: 20, 50, 100. Default: 50ms): "
if not "%audio_buffer_value%"=="" (
    set "scrcpy_options=%scrcpy_options% --audio-buffer=%audio_buffer_value%"
) else (
    rem Set default 50ms jika kosong
    set "scrcpy_options=%scrcpy_options% --audio-buffer=50"
)

echo.
echo === MEMERIKSA PERINTAH YANG AKAN DIJALANKAN ===
echo Perintah Lengkap:
echo "%scrcpy_command% %scrcpy_options%"
echo (Salin perintah di atas dan coba jalankan manual di CMD jika ada masalah)
echo =============================================
echo.
echo DEBUG: Akan menjalankan Scrcpy sekarang...
echo.

rem --- Coba jalankan scrcpy ---
"%scrcpy_command%" %scrcpy_options%

echo.
echo DEBUG: Scrcpy selesai atau gagal. Errorlevel: %errorlevel%
echo.
echo =================================================================
echo Scrcpy (mode audio) telah selesai atau ditutup.
echo Periksa output di atas, terutama Errorlevel.
echo Jika Errorlevel 9009, scrcpy.exe tidak ditemukan.
echo Jika Errorlevel 0 tapi tidak ada audio, pastikan HP terhubung, ADB aktif, dan audio forwarding didukung/diaktifkan.
echo Jendela ini akan tetap terbuka. Tekan tombol apa saja untuk kembali ke menu utama.
echo =================================================================
pause
goto menu

:exit_app
cls
echo ===================================
echo Terima kasih telah menggunakan
echo Scrcpy Launcher - By VAIZBTG
echo ===================================
echo Menutup aplikasi...
timeout /t 2 /nobreak >nul
exit /b
