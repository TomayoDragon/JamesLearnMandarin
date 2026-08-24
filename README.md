# Kuis Mandarin — Android App

Proyek Android Studio yang membungkus dua halaman kamu (`kamus.html` dan
`quiz.html`, sebelumnya `JamesLearnMandarin.html`) menjadi satu aplikasi
Android asli, 100% offline (library Excel sudah dibundel, tidak perlu CDN).

## Cara build & pasang APK

### Opsi A — Android Studio (paling mudah)
1. Ekstrak folder `mandarin-app` ini.
2. Buka **Android Studio** → `Open` → pilih folder `mandarin-app`.
3. Tunggu Gradle sync selesai (butuh koneksi internet sekali saja untuk
   mengunduh Gradle/AndroidX).
4. Sambungkan HP Android via USB (aktifkan *USB debugging*) atau pakai
   emulator, lalu klik tombol **Run ▶**.
5. Atau untuk file APK yang bisa dibagikan: menu `Build` → `Build App
   Bundle(s) / APK(s)` → `Build APK(s)`. File APK muncul di
   `app/build/outputs/apk/debug/app-debug.apk` — kirim/salin file ini ke HP
   dan instal (aktifkan dulu "Izinkan dari sumber tidak dikenal").

### Opsi B — command line (jika sudah ada Android SDK)
```
cd mandarin-app
./gradlew assembleDebug
```
APK akan ada di `app/build/outputs/apk/debug/app-debug.apk`.

## Yang sudah disesuaikan dari versi web
- Kedua file HTML dijalankan langsung dari dalam app (folder `assets/`),
  tidak butuh browser atau server.
- `localStorage` (tempat kamus tersimpan) tetap berfungsi normal di dalam
  WebView Android — data tersimpan permanen di HP selama app tidak
  di-uninstall / data app tidak dihapus.
- Library Excel (`xlsx.full.min.js`) diunduh dan dibundel langsung di dalam
  app (sebelumnya diambil dari CDN internet) — sehingga import/export Excel
  tetap jalan walau HP sedang offline.
- Tombol **Impor dari Excel** memakai pemilih file bawaan Android.
- Tombol **Export** menyimpan file `.xlsx` ke folder **Downloads** HP lewat
  jembatan native (karena WebView tidak bisa langsung men-download file
  seperti browser biasa).
- Nama file `JamesLearnMandarin.html` diganti menjadi `quiz.html` supaya
  tautan navigasi antar-halaman konsisten (tidak ada perubahan tampilan/isi).

## Struktur proyek
```
mandarin-app/
├── app/
│   ├── build.gradle
│   └── src/main/
│       ├── AndroidManifest.xml
│       ├── java/com/jameslearn/mandarin/MainActivity.java
│       ├── assets/
│       │   ├── kamus.html
│       │   ├── quiz.html
│       │   └── xlsx.full.min.js
│       └── res/...
├── build.gradle
└── settings.gradle
```

Butuh ikon app yang lebih bagus atau nama app diganti? Tinggal edit
`app/src/main/res/values/strings.xml` (nama) dan file PNG di
`app/src/main/res/mipmap/` (ikon).
