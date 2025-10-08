import 'package:json_annotation/json_annotation.dart';

part 'giftcard_models.g.dart';

// Currency Model
@JsonSerializable()
class Currency {
  final int id;
  final String name;
  final String symbol;
  @JsonKey(name: 'symbolNative')
  final String symbolNative;
  @JsonKey(name: 'decimalDigits')
  final int decimalDigits;
  final int rounding;
  final String code;
  @JsonKey(name: 'namePlural')
  final String namePlural;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  Currency({
    required this.id,
    required this.name,
    required this.symbol,
    required this.symbolNative,
    required this.decimalDigits,
    required this.rounding,
    required this.code,
    required this.namePlural,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}

// Receipt Category Model
@JsonSerializable()
class ReceiptCategory {
  final int id;
  @JsonKey(name: 'updated_by')
  final String updatedBy;
  final String status;
  final String title;
  final String amount;
  @JsonKey(name: 'range_id')
  final String rangeId;
  @JsonKey(name: 'gift_card_country_id')
  final String giftCardCountryId;
  @JsonKey(name: 'gift_card_id')
  final String giftCardId;

  ReceiptCategory({
    required this.id,
    required this.updatedBy,
    required this.status,
    required this.title,
    required this.amount,
    required this.rangeId,
    required this.giftCardCountryId,
    required this.giftCardId,
  });

  factory ReceiptCategory.fromJson(Map<String, dynamic> json) =>
      _$ReceiptCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptCategoryToJson(this);
}

// Card Range Model
@JsonSerializable()
class CardRange {
  final int id;
  @JsonKey(name: 'gift_card_id')
  final String giftCardId;
  @JsonKey(name: 'gift_card_country_id')
  final String giftCardCountryId;
  final String status;
  final String min;
  final String max;
  @JsonKey(name: 'updated_by')
  final String updatedBy;
  @JsonKey(name: 'receipt_categories')
  final List<ReceiptCategory> receiptCategories;

  CardRange({
    required this.id,
    required this.giftCardId,
    required this.giftCardCountryId,
    required this.status,
    required this.min,
    required this.max,
    required this.updatedBy,
    required this.receiptCategories,
  });

  factory CardRange.fromJson(Map<String, dynamic> json) =>
      _$CardRangeFromJson(json);

  Map<String, dynamic> toJson() => _$CardRangeToJson(this);
}

// Gift Card Country Model
@JsonSerializable()
class GiftCardCountry {
  final int id;
  final String status;
  final String name;
  final String image;
  final String iso;
  final Currency currency;
  final List<CardRange> ranges;

  GiftCardCountry({
    required this.id,
    required this.status,
    required this.name,
    required this.image,
    required this.iso,
    required this.currency,
    required this.ranges,
  });

  factory GiftCardCountry.fromJson(Map<String, dynamic> json) =>
      _$GiftCardCountryFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardCountryToJson(this);
}

// Gift Card Model
@JsonSerializable()
class GiftCardModel {
  final int id;
  final String title;
  final String image;
  @JsonKey(name: 'brand_logo')
  final String brandLogo;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'confirm_min')
  final int confirmMin;
  @JsonKey(name: 'confirm_max')
  final int confirmMax;
  final List<GiftCardCountry> countries;

  GiftCardModel({
    required this.id,
    required this.title,
    required this.image,
    required this.brandLogo,
    required this.status,
    required this.createdAt,
    required this.confirmMin,
    required this.confirmMax,
    required this.countries,
  });

  factory GiftCardModel.fromJson(Map<String, dynamic> json) =>
      _$GiftCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardModelToJson(this);
}

// Gift Card Rates Response
@JsonSerializable()
class GiftCardRatesResponse {
  final String message;
  @JsonKey(name: 'all_giftcards')
  final List<GiftCardModel> allGiftcards;

  GiftCardRatesResponse({
    required this.message,
    required this.allGiftcards,
  });

  factory GiftCardRatesResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftCardRatesResponseFromJson(json);
}

// Gift Card Calculate Request
@JsonSerializable()
class GiftCardCalculateRequest {
  @JsonKey(name: 'gift_card_id')
  final int giftCardId;
  @JsonKey(name: 'country_id')
  final int countryId;
  @JsonKey(name: 'range_id')
  final int rangeId;
  @JsonKey(name: 'category_id')
  final int categoryId;
  final String action;
  final double amount;

  GiftCardCalculateRequest({
    required this.giftCardId,
    required this.countryId,
    required this.rangeId,
    required this.categoryId,
    required this.action,
    required this.amount,
  });

  Map<String, dynamic> toJson() => _$GiftCardCalculateRequestToJson(this);
}

// Gift Card Calculate Response
@JsonSerializable()
class GiftCardCalculateResponse {
  final String action;
  @JsonKey(name: 'gift_card')
  final Map<String, dynamic> giftCard;
  final Map<String, dynamic> country;
  final Map<String, dynamic> range;
  final Map<String, dynamic> category;
  @JsonKey(name: 'card_amount')
  final double cardAmount;
  @JsonKey(name: 'card_currency')
  final String cardCurrency;
  final String rate;
  @JsonKey(name: 'total_value')
  final String totalValue;
  @JsonKey(name: 'exchange_value_ngn')
  final double exchangeValueNgn;
  final String disclaimer;

  GiftCardCalculateResponse({
    required this.action,
    required this.giftCard,
    required this.country,
    required this.range,
    required this.category,
    required this.cardAmount,
    required this.cardCurrency,
    required this.rate,
    required this.totalValue,
    required this.exchangeValueNgn,
    required this.disclaimer,
  });

  factory GiftCardCalculateResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftCardCalculateResponseFromJson(json);
}
