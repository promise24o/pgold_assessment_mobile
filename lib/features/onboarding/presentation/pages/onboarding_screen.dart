import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../app/routes/app_routes.dart';
import '../models/onboarding_page_model.dart';
import '../widgets/onboarding_page_widget.dart';

/// Onboarding screen with multiple pages
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageModel> _pages = const [
    OnboardingPageModel(
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescription1,
      imagePath: AppAssets.onboarding1,
    ),
    OnboardingPageModel(
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescription2,
      imagePath: AppAssets.onboarding2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLastPage => _currentPage == _pages.length - 1;

  void _onNextPressed() {
    if (_isLastPage) {
      _navigateToLogin();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkipPressed() {
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            _buildTopBar(),
            
            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(page: _pages[index]);
                },
              ),
            ),
            
            // Bottom section with indicator and button
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!_isLastPage)
            TextButton(
              onPressed: _onSkipPressed,
              child: const Text(AppStrings.skip),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Column(
        children: [
          // Page indicator
          SmoothPageIndicator(
            controller: _pageController,
            count: _pages.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.primary,
              dotColor: AppColors.border,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 4,
              spacing: 8,
            ),
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Next/Get Started button
          SizedBox(
            width: double.infinity,
            height: AppDimensions.buttonHeightL,
            child: ElevatedButton(
              onPressed: _onNextPressed,
              child: Text(
                _isLastPage ? AppStrings.getStarted : AppStrings.next,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
