import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/home/presentation/pages/main_navigation.dart';
import '../../features/auth/presentation/pages/sign_in_screen.dart';
import '../../features/auth/presentation/pages/create_username_screen.dart';
import '../../features/auth/presentation/pages/create_account_screen.dart';
import '../../features/auth/presentation/pages/email_address_screen.dart';
import '../../features/auth/presentation/pages/verify_email_screen.dart';
import '../../features/auth/presentation/pages/enable_face_id_screen.dart';
import '../../features/auth/presentation/pages/enable_fingerprint_screen.dart';
import '../../features/auth/presentation/pages/selfie_verification_screen.dart';
import '../../features/rates/presentation/pages/rates_screen.dart';

/// Route generator for navigation
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );

      case AppRoutes.mainNavigation:
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const MainNavigation(),
          settings: settings,
        );

      // Auth routes
      case AppRoutes.signIn:
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );

      case AppRoutes.createUsername:
        return MaterialPageRoute(
          builder: (_) => const CreateUsernameScreen(),
          settings: settings,
        );

      case AppRoutes.createAccount:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => CreateAccountScreen(
            username: args?['username'],
          ),
          settings: settings,
        );

      case AppRoutes.emailAddress:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => EmailAddressScreen(
            registrationData: args,
          ),
          settings: settings,
        );

      case AppRoutes.verifyEmail:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => VerifyEmailScreen(
            email: args?['email'] ?? '',
          ),
          settings: settings,
        );

      case AppRoutes.selfieVerification:
        return MaterialPageRoute(
          builder: (_) => const SelfieVerificationScreen(),
          settings: settings,
        );

      case AppRoutes.enableFaceId:
        return MaterialPageRoute(
          builder: (_) => const EnableFaceIdScreen(),
          settings: settings,
        );

      case AppRoutes.enableFingerprint:
        return MaterialPageRoute(
          builder: (_) => const EnableFingerprintScreen(),
          settings: settings,
        );

      case AppRoutes.rates:
        return MaterialPageRoute(
          builder: (_) => const RatesScreen(),
          settings: settings,
        );

      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text('Route not found: $routeName'),
        ),
      ),
    );
  }
}
