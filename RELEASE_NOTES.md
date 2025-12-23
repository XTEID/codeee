# Release v1.0.0 - Scrcpy Launcher Enhanced

## 🎉 Initial Release

Launcher lengkap untuk scrcpy dengan berbagai fitur tambahan untuk kemudahan penggunaan.

## ✨ Fitur Utama

### 🖥️ **Launcher Utama (VAIZBTGSCRCPY.cmd)**
- ✅ Koneksi USB dengan berbagai opsi kustomisasi
- ✅ Mode audio-only untuk streaming audio
- ✅ Mode video tanpa audio untuk performa ringan
- ✅ **Resolusi default 1080p** (diperbarui dari 1024p)
- ✅ Pengaturan render driver (OpenGL, Direct3D, Software)
- ✅ Kontrol bitrate, FPS, dan audio buffer

### 📡 **Setup Koneksi Wireless (wireless_setup.bat)**
- ✅ Panduan step-by-step setup koneksi WiFi
- ✅ Otomatis mengaktifkan ADB over TCP/IP
- ✅ Koneksi tanpa kabel USB

### 🎬 **Perekam Layar (screen_recorder.bat)**
- ✅ Perekaman dengan/tanpa audio
- ✅ Mode kualitas tinggi dan rendah
- ✅ Penamaan file otomatis dengan timestamp
- ✅ Format output MP4/MKV

### 🎮 **Profile Manager (profile_manager.bat)**
- ✅ **Gaming Mode**: Optimasi untuk gaming dengan latensi rendah
- ✅ **Presentation Mode**: Kualitas tinggi untuk presentasi
- ✅ **Battery Saver Mode**: Hemat baterai dengan kualitas rendah
- ✅ **Audio Only Mode**: Streaming audio saja
- ✅ **Custom Profile**: Buat pengaturan sendiri

### 📱 **Device Manager (device_manager.bat)**
- ✅ Kelola multiple perangkat Android
- ✅ Mirror semua perangkat sekaligus
- ✅ Informasi detail perangkat (model, versi Android, resolusi, baterai)
- ✅ Restart ADB server

### 🔧 **Troubleshoot & Diagnostik (troubleshoot.bat)**
- ✅ Cek status ADB dan koneksi
- ✅ Panduan aktivasi USB Debugging
- ✅ Test koneksi perangkat
- ✅ Cek versi scrcpy
- ✅ Reset ADB
- ✅ Log diagnostik lengkap

## 🚀 Cara Penggunaan

1. **Download** semua file dari release ini
2. **Ekstrak** ke folder pilihan Anda
3. **Pastikan** scrcpy sudah terinstall dan ada di PATH
4. **Aktifkan** USB Debugging di perangkat Android
5. **Jalankan** `VAIZBTGSCRCPY.cmd`
6. **Pilih** fitur yang diinginkan dari menu

## 📋 Persyaratan Sistem

- ✅ Windows dengan Command Prompt
- ✅ ADB (Android Debug Bridge)
- ✅ Scrcpy versi terbaru
- ✅ Perangkat Android dengan USB Debugging aktif

## 🎯 Rekomendasi Penggunaan

### 🎮 Untuk Gaming:
- Gunakan Gaming Mode di Profile Manager
- Set resolusi 1280x720 atau lebih rendah
- FPS 60 dengan audio buffer 20ms

### 📊 Untuk Presentasi:
- Gunakan Presentation Mode
- Resolusi tinggi (1080p) dengan bitrate 15M
- Audio buffer 100ms untuk stabilitas

### 🔋 Untuk Hemat Baterai:
- Gunakan Battery Saver Mode
- Aktifkan turn-screen-off
- Resolusi 720p dengan FPS 15

## 📦 File yang Disertakan

- `VAIZBTGSCRCPY.cmd` - Launcher utama
- `wireless_setup.bat` - Setup koneksi wireless
- `screen_recorder.bat` - Perekam layar
- `profile_manager.bat` - Manager profil
- `device_manager.bat` - Manager perangkat
- `troubleshoot.bat` - Diagnostik dan troubleshoot
- `scrcpy.exe` - Executable scrcpy
- `adb.exe` - Android Debug Bridge
- File DLL dan dependencies lainnya

## 🐛 Troubleshooting

Jika mengalami masalah:
1. Jalankan **Troubleshoot & Diagnostik** dari menu utama
2. Cek log diagnostik yang dihasilkan
3. Pastikan USB Debugging aktif
4. Restart ADB jika perlu

## 👨‍💻 Kontributor

**Dibuat oleh**: VAIZBTG  
**Enhanced dengan**: Fitur tambahan untuk pengalaman yang lebih baik

---

**Download**: Unduh semua file dari Assets di bawah ini  
**Support**: Buka issue jika mengalami masalah  
**Star**: ⭐ Jika project ini membantu Anda!