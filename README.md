# Scrcpy Launcher Enhanced - By VAIZBTG

Launcher lengkap untuk scrcpy dengan berbagai fitur tambahan untuk kemudahan penggunaan.

## Fitur Utama

### 1. **Launcher Utama (VAIZBTGSCRCPY.cmd)**
- Koneksi USB dengan berbagai opsi kustomisasi
- Mode audio-only untuk streaming audio
- Mode video tanpa audio untuk performa ringan
- Pengaturan render driver, bitrate, FPS, dan audio buffer

### 2. **Setup Koneksi Wireless (wireless_setup.bat)**
- Panduan step-by-step setup koneksi WiFi
- Otomatis mengaktifkan ADB over TCP/IP
- Koneksi tanpa kabel USB

### 3. **Perekam Layar (screen_recorder.bat)**
- Perekaman dengan/tanpa audio
- Mode kualitas tinggi dan rendah
- Penamaan file otomatis dengan timestamp
- Format output MP4/MKV

### 4. **Profile Manager (profile_manager.bat)**
- Gaming Mode: Optimasi untuk gaming dengan latensi rendah
- Presentation Mode: Kualitas tinggi untuk presentasi
- Battery Saver Mode: Hemat baterai dengan kualitas rendah
- Audio Only Mode: Streaming audio saja
- Custom Profile: Buat pengaturan sendiri

### 5. **Device Manager (device_manager.bat)**
- Kelola multiple perangkat Android
- Mirror semua perangkat sekaligus
- Informasi detail perangkat (model, versi Android, resolusi, baterai)
- Restart ADB server

### 6. **Troubleshoot & Diagnostik (troubleshoot.bat)**
- Cek status ADB dan koneksi
- Panduan aktivasi USB Debugging
- Test koneksi perangkat
- Cek versi scrcpy
- Reset ADB
- Log diagnostik lengkap

## Cara Penggunaan

1. **Persiapan:**
   - Pastikan scrcpy sudah terinstall dan ada di PATH
   - Aktifkan USB Debugging di perangkat Android
   - Hubungkan perangkat via USB atau setup wireless

2. **Menjalankan:**
   ```cmd
   VAIZBTGSCRCPY.cmd
   ```

3. **Pilih fitur yang diinginkan dari menu utama**

## Persyaratan Sistem

- Windows dengan Command Prompt
- ADB (Android Debug Bridge)
- Scrcpy versi terbaru
- Perangkat Android dengan USB Debugging aktif

## Tips Penggunaan

### Untuk Gaming:
- Gunakan Gaming Mode di Profile Manager
- Set resolusi 1280x720 atau lebih rendah
- FPS 60 dengan audio buffer 20ms

### Untuk Presentasi:
- Gunakan Presentation Mode
- Resolusi tinggi dengan bitrate 15M
- Audio buffer 100ms untuk stabilitas

### Untuk Hemat Baterai:
- Gunakan Battery Saver Mode
- Aktifkan turn-screen-off
- Resolusi 720p dengan FPS 15

### Untuk Wireless:
1. Jalankan wireless_setup.bat
2. Ikuti instruksi setup
3. Cabut kabel USB setelah setup selesai
4. Gunakan launcher normal

## Troubleshooting

Jika mengalami masalah:
1. Jalankan Troubleshoot & Diagnostik dari menu utama
2. Cek log diagnostik yang dihasilkan
3. Pastikan USB Debugging aktif
4. Restart ADB jika perlu

## File yang Dihasilkan

- `scrcpy_diagnostic.log`: Log diagnostik sistem
- `*.mp4` / `*.mkv`: File rekaman layar
- `test_screen.png`: File test screenshot (sementara)

## Kontributor

Dibuat oleh: VAIZBTG
Enhanced dengan fitur tambahan untuk pengalaman yang lebih baik.