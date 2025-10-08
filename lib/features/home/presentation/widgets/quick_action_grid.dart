import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../app/routes/app_routes.dart';

/// Quick action grid with 8 action items
class QuickActionGrid extends StatelessWidget {
  const QuickActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = _getQuickActions();
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: AppDimensions.paddingM,
        mainAxisSpacing: AppDimensions.paddingM,
        childAspectRatio: 0.85,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return _QuickActionItem(
          label: action.label,
          iconPath: action.iconPath,
          color: action.color,
          onTap: () => action.onTap(context),
        );
      },
    );
  }

  List<_QuickActionModel> _getQuickActions() {
    return [
      _QuickActionModel(
        label: AppStrings.crypto,
        iconPath: AppAssets.crypto,
        color: const Color(0xFF1A1A1A),
        onTap: (context) {
          Navigator.of(context).pushNamed(AppRoutes.rates);
        },
      ),
      _QuickActionModel(
        label: AppStrings.giftcards,
        iconPath: AppAssets.giftcards,
        color: const Color(0xFF7C3AED),
        onTap: (context) {
          Navigator.of(context).pushNamed(AppRoutes.rates);
        },
      ),
      _QuickActionModel(
        label: AppStrings.topUp,
        iconPath: AppAssets.topUp,
        color: const Color(0xFFFF6B00),
        onTap: (context) {},
      ),
      _QuickActionModel(
        label: AppStrings.cableTV,
        iconPath: AppAssets.cableTV,
        color: const Color(0xFF0EA5E9),
        onTap: (context) {},
      ),
      _QuickActionModel(
        label: AppStrings.electricity,
        iconPath: AppAssets.electricity,
        color: const Color(0xFFEC4899),
        onTap: (context) {},
      ),
      _QuickActionModel(
        label: AppStrings.betting,
        iconPath: AppAssets.betting,
        color: const Color(0xFF8B5CF6),
        onTap: (context) {},
      ),
      _QuickActionModel(
        label: AppStrings.flight,
        iconPath: AppAssets.flight,
        color: const Color(0xFF06B6D4),
        onTap: (context) {},
      ),
      _QuickActionModel(
        label: AppStrings.userRank,
        iconPath: AppAssets.userRank,
        color: const Color(0xFFEF4444),
        onTap: (context) {},
      ),
    ];
  }
}

class _QuickActionItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionItem({
    required this.label,
    required this.iconPath,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 28,
                height: 28,
                color: color,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback icon if image not found
                  return Icon(
                    Icons.apps,
                    size: 28,
                    color: color,
                  );
                },
              ),
            ),
          ),
          
          const SizedBox(height: AppDimensions.paddingS),
          
          // Label
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionModel {
  final String label;
  final String iconPath;
  final Color color;
  final void Function(BuildContext) onTap;

  _QuickActionModel({
    required this.label,
    required this.iconPath,
    required this.color,
    required this.onTap,
  });
}
