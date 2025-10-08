import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_strings.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';
import 'theme/app_theme.dart';

/// Main application widget
class PgoldApp extends StatelessWidget {
  const PgoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
