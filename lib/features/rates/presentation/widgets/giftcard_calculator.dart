import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

/// Giftcard rate calculator widget
class GiftcardCalculator extends StatefulWidget {
  const GiftcardCalculator({super.key});

  @override
  State<GiftcardCalculator> createState() => _GiftcardCalculatorState();
}

class _GiftcardCalculatorState extends State<GiftcardCalculator> {
  final TextEditingController _cardValueController = TextEditingController();
  
  String? _selectedGiftcard;
  String? _selectedCountry;
  String? _selectedCardRange;
  String? _selectedReceiptCategory;
  String? _selectedAction;
  
  double _rate = 0;
  double _totalValue = 0;

  @override
  void dispose() {
    _cardValueController.dispose();
    super.dispose();
  }

  void _showActionSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select an Action',
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
              const SizedBox(height: 8),
              Text(
                'Choose your most preferred action',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppDimensions.paddingL),
              _buildActionOption(
                icon: Icons.card_giftcard,
                title: 'Sell Giftcards',
                subtitle: 'Sell Giftcards to cash Instantly',
                onTap: () {
                  setState(() => _selectedAction = 'Sell');
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: AppDimensions.paddingM),
              _buildActionOption(
                icon: Icons.shopping_bag,
                title: 'Buy Giftcards',
                subtitle: 'Buy Giftcards with cash',
                onTap: () {
                  setState(() => _selectedAction = 'Buy');
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: AppDimensions.paddingL),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: AppDimensions.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Giftcard Label
          const Text(
            'Giftcard',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Giftcard Dropdown
          _buildDropdownField(
            hint: 'Select Giftcard',
            value: _selectedGiftcard,
            onTap: () {
              // TODO: Show giftcard selector
            },
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Country Label
          const Text(
            'Country',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Country Dropdown
          _buildDropdownField(
            hint: 'Select Giftcard Country',
            value: _selectedCountry,
            onTap: () {
              // TODO: Show country selector
            },
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Card Range Label
          const Text(
            'Card Range',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Card Range Dropdown
          _buildDropdownField(
            hint: 'Select Card Range',
            value: _selectedCardRange,
            onTap: () {
              // TODO: Show card range selector
            },
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Receipt Category Label
          const Text(
            'Receipt Category',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Receipt Category Dropdown
          _buildDropdownField(
            hint: 'Select Receipt Category',
            value: _selectedReceiptCategory,
            onTap: () {
              // TODO: Show receipt category selector
            },
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Giftcard Action Label
          const Text(
            'Giftcard Action',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Giftcard Action Dropdown
          _buildDropdownField(
            hint: 'Select Giftcard Action',
            value: _selectedAction,
            onTap: _showActionSelector,
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Card Value Label
          const Text(
            'Card Value',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Card Value Input
          TextField(
            controller: _cardValueController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter Card Value',
              hintStyle: TextStyle(
                color: AppColors.textTertiary.withOpacity(0.5),
              ),
              filled: true,
              fillColor: AppColors.backgroundSecondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: AppDimensions.paddingXL),
          
          // Rate Display
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingL),
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rate',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      _rate.toStringAsFixed(0),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.paddingM),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Value',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '$_totalValue NGN',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Disclaimer
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'This is an estimated rate. Actual rate may differ.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String hint,
    required String? value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? hint,
              style: TextStyle(
                color: value == null
                    ? AppColors.textTertiary.withOpacity(0.5)
                    : AppColors.textPrimary,
                fontSize: 15,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}
