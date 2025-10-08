# PGold Assessment Mobile

A professional Flutter application for cryptocurrency and gift card trading platform.

## 🚀 Features

- ✅ Splash Screen with animations
- ✅ Onboarding flow with smooth page indicators
- 🔄 Authentication (Login, Register, Email Verification)
- 🔄 Biometric Authentication (Face ID/Fingerprint)
- 🔄 Home Dashboard
- 🔄 Rate Calculator (Buy/Sell/Trade/Swap)
- 🔄 Profile Management
- 🔄 Transaction History

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── app/
│   ├── app.dart             # Main app widget
│   ├── routes/              # Navigation & routing
│   └── theme/               # App theme configuration
├── core/
│   ├── constants/           # App constants (colors, strings, dimensions)
│   ├── utils/               # Utility functions
│   ├── network/             # API client & interceptors
│   └── storage/             # Local storage services
├── features/
│   ├── splash/              # Splash screen
│   ├── onboarding/          # Onboarding screens
│   ├── auth/                # Authentication features
│   ├── home/                # Home dashboard
│   └── rates/               # Rate calculator
└── shared/
    ├── widgets/             # Reusable widgets
    └── models/              # Shared data models

assets/
├── images/                  # Image assets
├── icons/                   # Icon assets (SVG)
└── fonts/                   # Custom fonts
```

## 🎨 Design System

### Colors
- **Primary Blue**: `#0066FF`
- **Background**: `#FFFFFF`
- **Text Primary**: `#1A1A1A`
- **Text Secondary**: `#666666`

### Typography
- **Font Family**: Inter
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK (>=3.9.2)
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pgold_assessment_mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add Assets**
   - Place images in `assets/images/`
   - Place icons in `assets/icons/`
   - Download and place Inter fonts in `assets/fonts/`
     - Inter-Regular.ttf
     - Inter-Medium.ttf
     - Inter-SemiBold.ttf
     - Inter-Bold.ttf

4. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

### State Management
- `flutter_bloc` - BLoC pattern for state management
- `equatable` - Value equality for models

### Networking
- `dio` - HTTP client
- `retrofit` - Type-safe REST client
- `json_annotation` - JSON serialization

### Local Storage
- `shared_preferences` - Simple key-value storage
- `flutter_secure_storage` - Secure storage for sensitive data

### UI & Animations
- `smooth_page_indicator` - Page indicators for onboarding
- `flutter_svg` - SVG rendering
- `cached_network_image` - Image caching
- `shimmer` - Shimmer loading effect

### Authentication
- `local_auth` - Biometric authentication

### Utilities
- `intl` - Internationalization
- `logger` - Logging
- `get_it` - Dependency injection
- `injectable` - Code generation for DI

## 🏗️ Architecture

This project follows **Clean Architecture** principles with **BLoC** pattern for state management:

- **Presentation Layer**: UI components, screens, and BLoC
- **Domain Layer**: Business logic, use cases, and entities
- **Data Layer**: Repositories, data sources, and models

## 🔧 Code Generation

Run code generation for JSON serialization and dependency injection:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📱 Supported Platforms

- ✅ iOS
- ✅ Android
- 🔄 Web (coming soon)

## 🔐 API Integration

The app connects to the PGold Assessment Backend API:
- Base URL: `https://your-backend-url.com/api/v1`
- Authentication: Bearer token (Laravel Sanctum)

## 👨‍💻 Development Guidelines

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

### Git Workflow
- Create feature branches from `develop`
- Use conventional commits
- Submit PRs for code review

### Commit Convention
```
feat: Add new feature
fix: Fix bug
docs: Update documentation
style: Format code
refactor: Refactor code
test: Add tests
chore: Update dependencies
```

## 📄 License

This project is private and confidential.

## 👥 Contributors

- Your Name - Initial work

---

Built with ❤️ using Flutter
