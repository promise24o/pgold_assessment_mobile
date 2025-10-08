import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../models/onboarding_page_model.dart';

/// Individual onboarding page widget
class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingPageWidget({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final isFirstPage = page.imagePath.contains('onboarding_1');
    
    if (isFirstPage) {
      // First page: Image extends to right, text left-aligned
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),
          
          // Illustration - extends to right edge
          _buildIllustration(),
          
          const SizedBox(height: AppDimensions.paddingXXL),
          
          // Title - left aligned
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingL,
            ),
            child: Text(
              page.title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          
          const SizedBox(height: AppDimensions.paddingM),
          
          // Description - left aligned
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingL,
            ),
            child: Text(
              page.description,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
          
          const Spacer(flex: 3),
        ],
      );
    }
    
    // Other pages: Centered image, left-aligned text
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),
          
          // Illustration
          _buildCenteredIllustration(),
          
          const SizedBox(height: AppDimensions.paddingXXL),
          
          // Title - left aligned
          Text(
            page.title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          
          const SizedBox(height: AppDimensions.paddingM),
          
          // Description - left aligned
          Text(
            page.description,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    // For first page - extends to right edge
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Image.asset(
        page.imagePath,
        fit: BoxFit.contain,
        alignment: Alignment.centerRight,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to icon if image not found
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.circular(AppDimensions.radiusL),
              ),
              child: Center(
                child: Icon(
                  _getIconForPage(),
                  size: 120,
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildCenteredIllustration() {
    // For other pages - centered
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Image.asset(
        page.imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to icon if image not found
          return Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary,
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            ),
            child: Center(
              child: Icon(
                _getIconForPage(),
                size: 120,
                color: AppColors.primary,
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForPage() {
    if (page.imagePath.contains('1')) {
      return Icons.card_giftcard;
    } else if (page.imagePath.contains('2')) {
      return Icons.credit_card;
    }
    return Icons.account_balance_wallet;
  }
}
