import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../app/routes/app_routes.dart';

/// Create username screen - First step of registration
class CreateUsernameScreen extends StatefulWidget {
  const CreateUsernameScreen({super.key});

  @override
  State<CreateUsernameScreen> createState() => _CreateUsernameScreenState();
}

class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  bool _isButtonEnabled = false;
  DateTime? _lastBackPress;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateUsername);
  }

  @override
  void dispose() {
    _usernameController.removeListener(_validateUsername);
    _usernameController.dispose();
    _usernameFocus.dispose();
    super.dispose();
  }

  void _validateUsername() {
    setState(() {
      _isButtonEnabled = _usernameController.text.length >= 4;
    });
  }

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (_lastBackPress == null || now.difference(_lastBackPress!) > const Duration(seconds: 2)) {
      _lastBackPress = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }
    return true;
  }

  void _onNext() {
    if (!_isButtonEnabled) return;
    Navigator.of(context).pushNamed(
      AppRoutes.createAccount,
      arguments: {'username': _usernameController.text},
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () async {
              final shouldPop = await _onWillPop();
              if (shouldPop && context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.paddingL),
              
              // Title
              Text(
                'Create a username',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingS),
              
              // Subtitle
              Text(
                'Pick a name that represents your financial journey!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingXL),
              
              // Username Label
              Text(
                'Username',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingS),
              
              // Username Input
              TextField(
                controller: _usernameController,
                focusNode: _usernameFocus,
                decoration: InputDecoration(
                  hintText: 'name@example.com',
                  hintStyle: TextStyle(
                    color: AppColors.textTertiary.withOpacity(0.5),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline,
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
              
              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? _onNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textWhite,
                    elevation: 0,
                    disabledBackgroundColor: AppColors.textTertiary.withOpacity(0.3),
                    disabledForegroundColor: AppColors.textWhite.withOpacity(0.5),
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
      ),
    );
  }
}
