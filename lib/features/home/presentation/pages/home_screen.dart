import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/models/user_model.dart';
import '../widgets/wallet_header.dart';
import '../widgets/quick_action_grid.dart';
import '../widgets/promotional_carousel.dart';

/// Home screen with wallet balance and quick actions
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final authService = getIt<AuthService>();
      final user = await authService.getProfile();
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error silently or show a message
    }
  }
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Wallet Header with blue background (fullscreen)
            WalletHeader(
              userName: _user?.fullName ?? 'User',
              balance: 7012723.00,
              currency: 'NGP',
            ),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // Quick Action Section
              _buildQuickActionSection(),
              
              const SizedBox(height: AppDimensions.paddingL),
              
              // Promotional Carousel
              const PromotionalCarousel(),
              
            const SizedBox(height: AppDimensions.paddingXL),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
      child: Column(
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.quickAction,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to all actions
                },
                child: Row(
                  children: [
                    Text(AppStrings.more),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ],
          ),          
          // Quick Actions Grid
          const QuickActionGrid(),
        ],
      ),
    );
  }
}
