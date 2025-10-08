import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/models/auth_models.dart';

/// Create account screen with full registration form
class CreateAccountScreen extends StatefulWidget {
  final String? username;
  
  const CreateAccountScreen({super.key, this.username});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  String _selectedCountryCode = '+234';
  String _selectedCountryFlag = '🇳🇬';
  String _selectedCountryName = 'Nigeria';
  String? _selectedReferralSource;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _fullNameController.removeListener(_validateForm);
    _phoneController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);
    _confirmPasswordController.removeListener(_validateForm);
    _fullNameController.dispose();
    _phoneController.dispose();
    _referralController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _fullNameController.text.length >= 3 &&
          _phoneController.text.length >= 10 &&
          _passwordController.text.length >= 6 &&
          _confirmPasswordController.text.length >= 6 &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  void _onNext() {
    if (!_isButtonEnabled) return;
    
    // Pass registration data to email screen
    Navigator.of(context).pushNamed(
      AppRoutes.emailAddress,
      arguments: {
        'username': widget.username,
        'fullName': _fullNameController.text,
        'phoneNumber': _selectedCountryCode + _phoneController.text,
        'referralCode': _referralController.text.isEmpty ? null : _referralController.text,
        'heardFrom': _selectedReferralSource,
        'password': _passwordController.text,
        'passwordConfirmation': _confirmPasswordController.text,
      },
    );
  }

  void _showCountrySelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingL),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Country',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: _buildCountryList(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<Widget> _buildCountryList() {
    final countries = [
      {'name': 'United States', 'code': '+1', 'flag': '🇺🇸'},
      {'name': 'United Kingdom', 'code': '+44', 'flag': '🇬🇧'},
      {'name': 'Nigeria', 'code': '+234', 'flag': '🇳🇬'},
      {'name': 'Canada', 'code': '+1', 'flag': '🇨🇦'},
      {'name': 'Ghana', 'code': '+233', 'flag': '🇬🇭'},
      {'name': 'South Africa', 'code': '+27', 'flag': '🇿🇦'},
      {'name': 'Kenya', 'code': '+254', 'flag': '🇰🇪'},
      {'name': 'India', 'code': '+91', 'flag': '🇮🇳'},
    ];

    return countries.map((country) {
      return InkWell(
        onTap: () {
          setState(() {
            _selectedCountryCode = country['code']!;
            _selectedCountryFlag = country['flag']!;
            _selectedCountryName = country['name']!;
          });
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL,
            vertical: AppDimensions.paddingM,
          ),
          child: Row(
            children: [
              Text(
                country['flag']!,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  country['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                country['code']!,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  void _showReferralSourceSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose an option',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimensions.paddingS),
                      Text(
                        'Choose one option to proceed to the next step',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingL,
                    ),
                    children: [
                      _buildReferralOption('Referral'),
                      _buildReferralOption('Social Media'),
                      _buildReferralOption('Website'),
                      _buildReferralOption('Ad'),
                      _buildReferralOption('Instagram'),
                      _buildReferralOption('Newspaper'),
                      _buildReferralOption('Billboard'),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildReferralOption(String option) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedReferralSource = option;
        });
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
        child: Text(
          option,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Indicator
              LinearProgressIndicator(
                value: 0.33,
                backgroundColor: AppColors.backgroundSecondary,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 4,
              ),
              
              const SizedBox(height: AppDimensions.paddingXL),
              
              // Title
              Text(
                'Create account',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingS),
              
              // Subtitle
              Text(
                'Create your PGOLD account to get started in minutes!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              
              const SizedBox(height: AppDimensions.paddingXL),
              
              // Full Name
              _buildLabel('Full Name'),
              const SizedBox(height: AppDimensions.paddingS),
              _buildTextField(
                controller: _fullNameController,
                hintText: 'Enter Full Name',
                prefixIcon: Icons.person_outline,
              ),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // Phone Number
              _buildLabel('Phone Number'),
              const SizedBox(height: AppDimensions.paddingS),
              _buildPhoneField(),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // Referral
              _buildLabel('Referral'),
              const SizedBox(height: AppDimensions.paddingS),
              _buildTextField(
                controller: _referralController,
                hintText: 'Referral code (Optional)',
                prefixIcon: Icons.card_giftcard_outlined,
              ),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // How did you hear about us
              _buildLabel('How did you hear about us (Optional)'),
              const SizedBox(height: AppDimensions.paddingS),
              _buildDropdownField(),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // Password
              _buildLabel('Password'),
              const SizedBox(height: AppDimensions.paddingS),
              _buildPasswordField(
                controller: _passwordController,
                hintText: 'Re-Type Password',
                isVisible: _isPasswordVisible,
                onToggle: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // Confirm Password
              _buildLabel('Confirm Password'),
              const SizedBox(height: AppDimensions.paddingS),
              _buildPasswordField(
                controller: _confirmPasswordController,
                hintText: 'Re-Type Password',
                isVisible: _isConfirmPasswordVisible,
                onToggle: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
              
              const SizedBox(height: AppDimensions.paddingXXL),
              
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
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.textTertiary.withOpacity(0.5),
        ),
        prefixIcon: Icon(
          prefixIcon,
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
    );
  }

  Widget _buildPhoneField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Enter Phone Number',
        hintStyle: TextStyle(
          color: AppColors.textTertiary.withOpacity(0.5),
        ),
        prefixIcon: InkWell(
          onTap: _showCountrySelector,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _selectedCountryFlag,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 4),
                Text(
                  _selectedCountryCode,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, size: 20),
              ],
            ),
          ),
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
    );
  }

  Widget _buildDropdownField() {
    return InkWell(
      onTap: _showReferralSourceSelector,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: AppColors.textTertiary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _selectedReferralSource ?? 'How did you hear about us',
                style: TextStyle(
                  color: _selectedReferralSource == null
                      ? AppColors.textTertiary.withOpacity(0.5)
                      : AppColors.textPrimary,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.textTertiary.withOpacity(0.5),
        ),
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: AppColors.textTertiary,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.textTertiary,
          ),
          onPressed: onToggle,
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
    );
  }
}
