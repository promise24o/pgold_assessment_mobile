import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/home/presentation/pages/main_navigation.dart';

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

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const MainNavigation(),
          settings: settings,
        );

      // TODO: Add more routes as we build features
      // case AppRoutes.login:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //     settings: settings,
      //   );

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
