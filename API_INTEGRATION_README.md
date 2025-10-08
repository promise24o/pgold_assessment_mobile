# API Integration Setup

## Overview
This project integrates with the PGold Assessment Backend API for authentication and onboarding.

**Base URL:** `https://pgold-assessment-backend.onrender.com/api/v1`

## Setup Instructions

### 1. Generate JSON Serialization Code
Run the following command to generate the required `.g.dart` files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or for watch mode (auto-generates on file changes):

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 2. Architecture

#### Core Components:
- **`lib/core/network/`** - API client and constants
  - `api_constants.dart` - All API endpoints
  - `dio_client.dart` - HTTP client with interceptors

- **`lib/core/models/`** - Data models
  - `user_model.dart` - User entity
  - `auth_models.dart` - Request/Response DTOs

- **`lib/core/services/`** - Business logic
  - `auth_service.dart` - Authentication operations

- **`lib/core/di/`** - Dependency injection
  - `service_locator.dart` - GetIt setup

### 3. Implemented Endpoints

#### Authentication
- ✅ `POST /register` - User registration
- ✅ `POST /login` - User login
- ✅ `POST /logout` - User logout
- ✅ `GET /profile` - Get user profile

#### Email Verification
- ✅ `POST /verify-email` - Send verification code
- ✅ `POST /confirm-email` - Confirm email with code
- ✅ `POST /resend-verification` - Resend verification code

#### Biometric Setup
- ✅ `POST /enable-face-id` - Enable/disable Face ID
- ✅ `POST /enable-fingerprint` - Enable/disable Fingerprint
- ✅ `POST /setup-biometrics` - Setup both biometrics

### 4. Usage Example

```dart
import 'package:pgold_assessment_mobile/core/di/service_locator.dart';
import 'package:pgold_assessment_mobile/core/services/auth_service.dart';
import 'package:pgold_assessment_mobile/core/models/auth_models.dart';

// Get service instance
final authService = getIt<AuthService>();

// Login
try {
  final response = await authService.login(
    LoginRequest(
      email: 'user@example.com',
      password: 'password123',
    ),
  );
  print('Logged in: ${response.user.username}');
  print('Token: ${response.token}');
} catch (e) {
  print('Login failed: $e');
}

// Register
try {
  final response = await authService.register(
    RegisterRequest(
      username: 'johndoe',
      email: 'john@example.com',
      fullName: 'John Doe',
      phoneNumber: '08012345678',
      password: 'Password123',
      passwordConfirmation: 'Password123',
    ),
  );
  print('Registered: ${response.user.username}');
} catch (e) {
  print('Registration failed: $e');
}

// Verify Email
try {
  await authService.confirmEmail('john@example.com', '123456');
  print('Email verified successfully');
} catch (e) {
  print('Verification failed: $e');
}
```

### 5. Secure Storage

User tokens and sensitive data are stored securely using `flutter_secure_storage`:
- `auth_token` - Bearer token for API authentication
- `user_id` - Current user ID
- `user_email` - Current user email
- `pending_email` - Email awaiting verification

### 6. Error Handling

The `DioClient` handles common HTTP errors:
- 400 - Bad request
- 401 - Unauthorized (auto-logout recommended)
- 403 - Forbidden
- 404 - Not found
- 422 - Validation failed
- 500 - Internal server error
- 503 - Service unavailable

Validation errors from the API are automatically extracted and displayed.

### 7. Next Steps

To integrate with UI:
1. Run the code generator
2. Update sign-in screen to call `authService.login()`
3. Update registration flow to call `authService.register()`
4. Update email verification to call `authService.confirmEmail()`
5. Update biometric screens to call biometric setup endpoints
6. Add error handling and loading states
7. Navigate to home screen after successful authentication

### 8. Testing

Test the API integration:
```bash
# Run tests
flutter test

# Run app
flutter run
```

## API Documentation

Full API documentation: [OpenAPI Spec provided in requirements]

## Support

For API issues, contact: support@pgoldapp.com
