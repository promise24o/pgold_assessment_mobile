import '../network/dio_client.dart';
import '../network/api_constants.dart';
import '../models/crypto_models.dart';
import '../models/giftcard_models.dart';

class RatesService {
  final DioClient _dioClient;

  RatesService(this._dioClient);

  // Get Crypto Rates
  Future<List<CryptoModel>> getCryptoRates() async {
    try {
      final response = await _dioClient.get(ApiConstants.cryptoRates);
      final cryptoResponse = CryptoRatesResponse.fromJson(response.data);
      return cryptoResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  // Calculate Crypto Rate
  Future<CryptoCalculateResponse> calculateCrypto(
    CryptoCalculateRequest request,
  ) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.calculateCrypto,
        data: request.toJson(),
      );
      return CryptoCalculateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Get Gift Card Rates
  Future<List<GiftCardModel>> getGiftCardRates() async {
    try {
      final response = await _dioClient.get(ApiConstants.giftCardRates);
      final giftCardResponse = GiftCardRatesResponse.fromJson(response.data);
      return giftCardResponse.allGiftcards;
    } catch (e) {
      rethrow;
    }
  }

  // Calculate Gift Card Rate
  Future<GiftCardCalculateResponse> calculateGiftCard(
    GiftCardCalculateRequest request,
  ) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.calculateGiftCard,
        data: request.toJson(),
      );
      return GiftCardCalculateResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
