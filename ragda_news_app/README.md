# RagdaNews App

RagdaNews adalah aplikasi berita Flutter yang menyediakan informasi terkini dengan antarmuka yang modern dan mudah digunakan.

## 📱 Fitur Aplikasi

- **Dashboard** - Tampilan ringkasan status mesin, statistik produksi, dan jadwal maintenance
- **News Feed** - Daftar berita terbaru dengan refresh indicator
- **Detail News** - Tampilan detail artikel dengan gambar dan informasi lengkap
- **Profile Management** - Halaman profil pengguna dengan pengaturan akun
- **Authentication** - Sistem login yang aman dengan validasi

## 🛠️ Teknologi

- **Framework**: Flutter
- **State Management**: GetX
- **Architecture**: MVC Pattern
- **UI Components**: Material Design
- **Network**: HTTP untuk API calls
- **Platform Support**: Android, iOS, Web, Windows, macOS, Linux

## 📋 Prerequisites

Sebelum menjalankan project, pastikan Anda telah menginstall:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versi 3.16.0 atau lebih baru)
- [Dart SDK](https://dart.dev/get-dart) (sudah termasuk dalam Flutter)
- [Android Studio](https://developer.android.com/studio) atau [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

### Platform-specific Requirements:

**Android:**

- Android Studio dengan Android SDK
- Android Virtual Device (AVD) atau perangkat Android fisik

**iOS (macOS only):**

- Xcode 12.0 atau lebih baru
- iOS Simulator atau perangkat iOS fisik
- CocoaPods (`sudo gem install cocoapods`)

**Web:**

- Browser modern (Chrome, Firefox, Safari, Edge)

**Desktop:**

- **Windows**: Visual Studio 2022 dengan C++ workload
- **macOS**: Xcode command line tools
- **Linux**: CMake, Ninja, GTK development libraries

## 🚀 Cara Menjalankan Project

### 1. Clone Repository

```bash
git clone https://github.com/adrianAlviYendri/RagdaNews.git
cd RagdaNews/ragda_news_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Konfigurasi Environment

Buat file `.env` di root project dan sesuaikan dengan `.env.example`:

```bash
cp .env.example .env
```

Edit file `.env` sesuai dengan konfigurasi Anda:

```env
NEWS_API_KEY=your_news_api_key_here
```

### 4. Verifikasi Setup Flutter

```bash
flutter doctor
```

Pastikan semua checklist ✅ hijau atau minimal platform yang ingin Anda gunakan sudah ready.

### 5. Jalankan Aplikasi

#### Android/iOS (Mobile):

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device_id>

# Run in debug mode (default)
flutter run

# Run in release mode
flutter run --release
```

#### Web:

```bash
# Run on web
flutter run -d chrome

# Build for web
flutter build web
```

#### Desktop:

**Windows:**

```bash
flutter run -d windows
flutter build windows
```

**macOS:**

```bash
flutter run -d macos
flutter build macos
```

**Linux:**

```bash
flutter run -d linux
flutter build linux
```

## 🏗️ Build untuk Production

### Android APK:

```bash
flutter build apk --release
```

### Android App Bundle (recommended):

```bash
flutter build appbundle --release
```

### iOS:

```bash
flutter build ios --release
```

### Web:

```bash
flutter build web --release
```

### Desktop:

```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## 📁 Struktur Project

```
ragda_news_app/
├── lib/
│   ├── controllers/          # GetX Controllers
│   ├── models/              # Data Models
│   ├── routes/              # App Routes
│   ├── screen/              # UI Screens
│   ├── widgets/             # Reusable Widgets
│   └── main.dart            # Entry Point
├── android/                 # Android specific files
├── ios/                     # iOS specific files
├── web/                     # Web specific files
├── windows/                 # Windows specific files
├── macos/                   # macOS specific files
├── linux/                   # Linux specific files
├── .env.example             # Environment template
└── pubspec.yaml             # Dependencies
```

## 🔧 Development Commands

```bash
# Hot reload during development
# Press 'r' in terminal atau save file

# Hot restart
# Press 'R' in terminal

# Format code
flutter format .

# Analyze code
flutter analyze

# Run tests
flutter test

# Clean build cache
flutter clean && flutter pub get

# Check outdated packages
flutter pub outdated

# Update packages
flutter pub upgrade
```

## 📱 Testing

### Unit Tests:

```bash
flutter test
```

### Integration Tests:

```bash
flutter test integration_test/
```

### Widget Tests:

```bash
flutter test test/widget_test.dart
```

## 🔐 Credentials untuk Testing

```
Email: hasan@gmail.com
Password: Hasan17.
```

## 🚨 Troubleshooting

### Common Issues:

1. **"Flutter command not found"**

   ```bash
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

2. **Gradle build failed (Android)**

   ```bash
   cd android && ./gradlew clean
   cd .. && flutter clean && flutter pub get
   ```

3. **CocoaPods issues (iOS)**

   ```bash
   cd ios && pod deintegrate && pod install
   ```

4. **VS Code Flutter extension issues**
   - Restart VS Code
   - Run "Flutter: Reload All Extensions"

## 🤝 Contributing

1. Fork the project
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📞 Support

Jika mengalami masalah atau membutuhkan bantuan:

1. Check [Flutter Documentation](https://flutter.dev/docs)
2. Browse [Flutter Community](https://flutter.dev/community)
3. Open [GitHub Issues](https://github.com/yourusername/RagdaNews/issues)

## 🔄 Updates

Untuk mendapatkan update terbaru:

```bash
git pull origin main
flutter pub get
```

---

**Happy Coding! 🚀**
