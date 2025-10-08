import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../app/routes/app_routes.dart';

/// Enable Face ID screen
class EnableFaceIdScreen extends StatelessWidget {
  const EnableFaceIdScreen({super.key});

  void _onActivate(BuildContext context) {
    // TODO: Implement Face ID activation
    Navigator.of(context).pushNamed(AppRoutes.enableFingerprint);
  }

  void _onSkip(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.enableFingerprint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.paddingXL),
              
              Text(
                'Enable Face ID',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingS),
              
              Text(
                'Protect your account with face recognition.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              
              const Spacer(),
              
              // Face ID Icon
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.face,
                      size: 60,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Activate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _onActivate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textWhite,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    ),
                  ),
                  child: const Text(
                    'Activate Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingM),
              
              // Maybe Later Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => _onSkip(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    ),
                  ),
                  child: const Text(
                    'Maybe Later',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingL),
            ],
          ),
        ),
      ),
    );
  }
}
