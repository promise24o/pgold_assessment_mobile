import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_assets.dart';

/// Wallet header with balance and user info
class WalletHeader extends StatefulWidget {
  final String userName;
  final double balance;
  final String currency;

  const WalletHeader({
    super.key,
    required this.userName,
    required this.balance,
    required this.currency,
  });

  @override
  State<WalletHeader> createState() => _WalletHeaderState();
}

class _WalletHeaderState extends State<WalletHeader> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0', 'en_US');
    final formattedBalance = numberFormat.format(widget.balance);
    final decimalPart = widget.balance.toStringAsFixed(2).split('.')[1];
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0039E6), // Deep royal blue
            Color(0xFF1D4ED8), // Medium blue
            Color(0xFF2563EB), // Bright mid-blue
            Color(0xFF3B82F6), // Light blue tint
          ],
          stops: [0.0, 0.4, 0.75, 1.0],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.radiusXL),
          bottomRight: Radius.circular(AppDimensions.radiusXL),
        ),
        image: const DecorationImage(
          image: AssetImage(AppAssets.patterns),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add top spacing to push content down from status bar
            const SizedBox(height: 40),
            
            // Top Row: Profile, Greeting, Actions
            Row(
              children: [
                // Profile Picture
                _buildProfilePicture(),
                
                const SizedBox(width: AppDimensions.paddingM),
                
                // Greeting
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${AppStrings.hello} ${widget.userName}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text('👋', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.topOfTheMorning,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textWhite.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Action Icons
                _buildActionIcons(),
              ],
            ),
            
            const SizedBox(height: AppDimensions.paddingXL),
            
            // Wallet Balance
            Row(
              children: [
                Text(
                  AppStrings.walletBalance,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textWhite.withOpacity(0.9),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                  borderRadius: BorderRadius.circular(AppDimensions.radiusCircle),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.textWhite.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                      size: 16,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppDimensions.paddingS),
            
            // Balance Amount and Currency Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Balance with fading decimals
                _isBalanceVisible
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '₦',
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    fontFamily: null, // Use system font for symbol
                                  ),
                                ),
                                TextSpan(
                                  text: formattedBalance,
                                  style: const TextStyle(
                                    color: AppColors.textWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    fontFamily: 'Sora',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '.$decimalPart',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppColors.textWhite.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      )
                    : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '₦',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                fontFamily: null, // Use system font for symbol
                              ),
                            ),
                            const TextSpan(
                              text: '******',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                fontFamily: 'Sora',
                              ),
                            ),
                          ],
                        ),
                      ),
                
                // Currency Selector with pgold icon
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingM,
                    vertical: AppDimensions.paddingS,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusCircle),
                    border: Border.all(
                      color: const Color(0xFF0052FF).withOpacity(0.33),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.pgold,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.currency,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: AppColors.textPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppDimensions.paddingL),
            
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  context,
                  label: AppStrings.withdraw,
                  iconPath: AppAssets.withdrawal,
                  onTap: () {
                    // TODO: Navigate to withdraw
                  },
                ),
                const SizedBox(width: AppDimensions.paddingM),
                _buildActionButton(
                  context,
                  label: AppStrings.deposit,
                  iconPath: AppAssets.deposit,
                  onTap: () {
                    // TODO: Navigate to deposit
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.textWhite.withOpacity(0.3),
          width: 2,
        ),
        image: const DecorationImage(
          image: AssetImage(AppAssets.profilePlaceholder),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildActionIcons() {
    return Row(
      children: [
        _buildIconButton(
          icon: Bootstrap.chat_dots,
          onTap: () {
            // TODO: Open messages
          },
        ),
        const SizedBox(width: AppDimensions.paddingS),
        _buildIconButton(
          icon: Bootstrap.bell,
          onTap: () {
            // TODO: Open notifications
          },
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusCircle),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingS),
        decoration: BoxDecoration(
          color: AppColors.textWhite.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.textWhite,
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.textWhite,
        foregroundColor: AppColors.primary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(
            color: const Color(0xFF0052FF).withOpacity(0.33),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular blue background with icon
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 20,
                height: 20,
                color: AppColors.textWhite,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
