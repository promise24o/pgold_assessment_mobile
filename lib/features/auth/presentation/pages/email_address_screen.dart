import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/models/auth_models.dart';

/// Email address input screen
class EmailAddressScreen extends StatefulWidget {
  final Map<String, dynamic>? registrationData;
  
  const EmailAddressScreen({super.key, this.registrationData});

  @override
  State<EmailAddressScreen> createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onNext() async {
    if (_emailController.text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final authService = getIt<AuthService>();
      final data = widget.registrationData ?? {};
      
      // Register user with complete data
      final response = await authService.register(
        RegisterRequest(
          username: data['username'] ?? '',
          email: _emailController.text,
          fullName: data['fullName'] ?? '',
          phoneNumber: data['phoneNumber'],
          referralCode: data['referralCode'],
          heardFrom: data['heardFrom'],
          password: data['password'] ?? '',
          passwordConfirmation: data['passwordConfirmation'] ?? '',
        ),
      );

      setState(() => _isLoading = false);

      // Navigate to verification screen with email
      if (mounted) {
        Navigator.of(context).pushNamed(
          AppRoutes.verifyEmail,
          arguments: {'email': _emailController.text},
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);

      // Show error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Indicator
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: AppColors.backgroundSecondary,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 4,
              ),
              
              const SizedBox(height: AppDimensions.paddingXL),
              
              Text(
                'Email Address',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingS),
              
              Text(
                'Make sure you enter your details correctly!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingXL),
              
              Text(
                'Email Address',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingS),
              
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email Address',
                  hintStyle: TextStyle(
                    color: AppColors.textTertiary.withOpacity(0.5),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textTertiary,
                  ),
                  filled: true,
                  fillColor: AppColors.backgroundSecondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textWhite,
                    elevation: 0,
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.textWhite),
                          ),
                        )
                      : const Text(
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
}
