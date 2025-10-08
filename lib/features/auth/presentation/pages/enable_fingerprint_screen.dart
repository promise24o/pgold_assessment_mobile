import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../app/routes/app_routes.dart';

/// Enable Fingerprint screen
class EnableFingerprintScreen extends StatefulWidget {
  const EnableFingerprintScreen({super.key});

  @override
  State<EnableFingerprintScreen> createState() => _EnableFingerprintScreenState();
}

class _EnableFingerprintScreenState extends State<EnableFingerprintScreen> {
  bool _isScanning = false;
  bool _isComplete = false;

  void _startScan() {
    setState(() {
      _isScanning = true;
    });
    
    // Simulate fingerprint scan
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isScanning = false;
          _isComplete = true;
        });
      }
    });
  }

  void _onNext() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.mainNavigation);
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
              // Progress Indicator
              LinearProgressIndicator(
                value: 1.0,
                backgroundColor: AppColors.backgroundSecondary,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 4,
              ),
              
              const SizedBox(height: AppDimensions.paddingXXL),
              
              Text(
                'Enable Fingerprint',
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
              
              // Fingerprint Icon
              _buildFingerprintIcon(),
              
              const SizedBox(height: AppDimensions.paddingXL),
              
              // Status Text
              Text(
                _isComplete
                    ? 'Biometrics Completed'
                    : _isScanning
                        ? 'Place Your Finger on Circle'
                        : 'Tap to Scan',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              
              if (_isScanning)
                Padding(
                  padding: const EdgeInsets.only(top: AppDimensions.paddingXL),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundSecondary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 30,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
              
              const Spacer(),
              
              // Next Button (only show when complete)
              if (_isComplete)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onNext,
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
                      'Next',
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

  Widget _buildFingerprintIcon() {
    return GestureDetector(
      onTap: _isComplete ? null : _startScan,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _isComplete
              ? AppColors.primary.withOpacity(0.1)
              : AppColors.backgroundSecondary,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer ring for scanning animation
            if (_isScanning)
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 2,
                  ),
                ),
              ),
            // Inner fingerprint icon
            Icon(
              Icons.fingerprint,
              size: 100,
              color: _isComplete
                  ? AppColors.primary
                  : _isScanning
                      ? AppColors.primary.withOpacity(0.7)
                      : AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}
