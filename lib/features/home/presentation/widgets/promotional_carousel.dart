import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_assets.dart';

/// Promotional carousel with referral and pay bills cards
class PromotionalCarousel extends StatefulWidget {
  const PromotionalCarousel({super.key});

  @override
  State<PromotionalCarousel> createState() => _PromotionalCarouselState();
}

class _PromotionalCarouselState extends State<PromotionalCarousel> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel
        SizedBox(
          height: 160,
          child: PageView(
            controller: _pageController,
            children: [
              _buildReferralCard(),
              _buildPayBillsCard(),
            ],
          ),
        ),
        
        const SizedBox(height: AppDimensions.paddingM),
        
        // Page Indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: 2,
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.primary,
            dotColor: AppColors.border,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildReferralCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        AppAssets.referralBanner,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Fallback if image not found
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0EA5E9), Color(0xFF0066FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            ),
            child: const Center(
              child: Icon(
                Icons.people,
                size: 80,
                color: Colors.white24,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPayBillsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        AppAssets.payBillsBanner,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Fallback if image not found
          return Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundTertiary,
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            ),
            child: Center(
              child: Icon(
                Icons.payment,
                size: 80,
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
          );
        },
      ),
    );
  }
}
