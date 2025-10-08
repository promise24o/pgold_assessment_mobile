import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/services/rates_service.dart';
import '../../../../core/models/crypto_models.dart';

/// Crypto rate calculator widget
class CryptoCalculator extends StatefulWidget {
  const CryptoCalculator({super.key});

  @override
  State<CryptoCalculator> createState() => _CryptoCalculatorState();
}

class _CryptoCalculatorState extends State<CryptoCalculator> {
  final TextEditingController _valueController = TextEditingController();
  
  List<CryptoModel> _cryptoList = [];
  CryptoModel? _selectedCrypto;
  String? _selectedAction;
  bool _isLoading = true;
  
  double _rate = 0;
  double _totalValue = 0;

  @override
  void initState() {
    super.initState();
    _loadCryptoRates();
    _valueController.addListener(_calculateRate);
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _loadCryptoRates() async {
    try {
      final ratesService = getIt<RatesService>();
      final cryptos = await ratesService.getCryptoRates();
      setState(() {
        _cryptoList = cryptos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load crypto rates: ${e.toString().replaceAll('Exception: ', '')}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _calculateRate() async {
    if (_selectedCrypto == null || _selectedAction == null || _valueController.text.isEmpty) {
      return;
    }

    final value = double.tryParse(_valueController.text);
    if (value == null || value <= 0) {
      return;
    }

    try {
      final ratesService = getIt<RatesService>();
      final result = await ratesService.calculateCrypto(
        CryptoCalculateRequest(
          code: _selectedCrypto!.code,
          action: _selectedAction!.toLowerCase(),
          usdValue: value,
        ),
      );

      setState(() {
        _rate = result.appliedRate;
        _totalValue = result.exchangeValueNgn;
      });
    } catch (e) {
      // Handle error silently or show message
    }
  }

  void _showCryptoSelector() {
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
                    'Select Crypto',
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
              const SizedBox(height: AppDimensions.paddingL),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _cryptoList.length,
                  itemBuilder: (context, index) {
                    final crypto = _cryptoList[index];
                    return ListTile(
                      leading: Image.network(
                        crypto.icon,
                        width: 32,
                        height: 32,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.currency_bitcoin);
                        },
                      ),
                      title: Text(crypto.name),
                      subtitle: Text(crypto.code),
                      onTap: () {
                        setState(() {
                          _selectedCrypto = crypto;
                        });
                        Navigator.pop(context);
                        _calculateRate();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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
                icon: Icons.sell,
                title: 'Sell Crypto',
                subtitle: 'Sell Crypto at the best market rate',
                onTap: () {
                  setState(() => _selectedAction = 'Sell');
                  Navigator.pop(context);
                  _calculateRate();
                },
              ),
              const SizedBox(height: AppDimensions.paddingM),
              _buildActionOption(
                icon: Icons.shopping_cart,
                title: 'Buy Crypto',
                subtitle: 'Sell Crypto at the best market rate',
                onTap: () {
                  setState(() => _selectedAction = 'Buy');
                  Navigator.pop(context);
                  _calculateRate();
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
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Crypto Label
          const Text(
            'Crypto',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Crypto Dropdown
          _buildDropdownField(
            hint: 'Choose Crypto',
            value: _selectedCrypto?.name,
            onTap: _showCryptoSelector,
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Crypto Action Label
          const Text(
            'Crypto Action',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Crypto Action Dropdown
          _buildDropdownField(
            hint: 'Select Crypto Action',
            value: _selectedAction,
            onTap: _showActionSelector,
          ),
          
          const SizedBox(height: AppDimensions.paddingL),
          
          // Crypto Value Label
          const Text(
            'Crypto Value (\$USD)',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: AppDimensions.paddingS),
          
          // Crypto Value Input
          TextField(
            controller: _valueController,
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
