/// API constants and endpoints
class ApiConstants {
  ApiConstants._();

  // Environment Configuration
  // Set to true for local development, false for production
  static const bool useLocalApi = false;

  // Base URLs
  static const String productionUrl = 'https://pgold-assessment-backend.onrender.com/api/v1';
  static const String localUrl = 'http://localhost:8000/api/v1';
  
  // Active API URL (automatically switches based on useLocalApi)
  static String get apiBaseUrl => useLocalApi ? localUrl : productionUrl;

  // Authentication Endpoints
  static const String register = '/register';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String profile = '/profile';

  // Email Verification Endpoints
  static const String verifyEmail = '/verify-email';
  static const String confirmEmail = '/confirm-email';
  static const String resendVerification = '/resend-verification';

  // Biometric Setup Endpoints
  static const String enableFaceId = '/enable-face-id';
  static const String enableFingerprint = '/enable-fingerprint';
  static const String setupBiometrics = '/setup-biometrics';

  // Homepage Endpoint
  static const String home = '/home';

  // Rates Endpoints
  static const String cryptoRates = '/rates/crypto';
  static const String giftCardRates = '/rates/gift-cards';
  static const String allRates = '/rates';

  // Calculation Endpoints
  static const String calculateCrypto = '/calculate/crypto';
  static const String calculateGiftCard = '/calculate/gift-card';

  // Headers
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  
  // Timeout
  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
}
