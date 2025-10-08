// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giftcard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      symbolNative: json['symbolNative'] as String,
      decimalDigits: (json['decimalDigits'] as num).toInt(),
      rounding: (json['rounding'] as num).toInt(),
      code: json['code'] as String,
      namePlural: json['namePlural'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'symbolNative': instance.symbolNative,
      'decimalDigits': instance.decimalDigits,
      'rounding': instance.rounding,
      'code': instance.code,
      'namePlural': instance.namePlural,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ReceiptCategory _$ReceiptCategoryFromJson(Map<String, dynamic> json) =>
    ReceiptCategory(
      id: (json['id'] as num).toInt(),
      updatedBy: json['updated_by'] as String,
      status: json['status'] as String,
      title: json['title'] as String,
      amount: json['amount'] as String,
      rangeId: json['range_id'] as String,
      giftCardCountryId: json['gift_card_country_id'] as String,
      giftCardId: json['gift_card_id'] as String,
    );

Map<String, dynamic> _$ReceiptCategoryToJson(ReceiptCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_by': instance.updatedBy,
      'status': instance.status,
      'title': instance.title,
      'amount': instance.amount,
      'range_id': instance.rangeId,
      'gift_card_country_id': instance.giftCardCountryId,
      'gift_card_id': instance.giftCardId,
    };

CardRange _$CardRangeFromJson(Map<String, dynamic> json) => CardRange(
      id: (json['id'] as num).toInt(),
      giftCardId: json['gift_card_id'] as String,
      giftCardCountryId: json['gift_card_country_id'] as String,
      status: json['status'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
      updatedBy: json['updated_by'] as String,
      receiptCategories: (json['receipt_categories'] as List<dynamic>)
          .map((e) => ReceiptCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardRangeToJson(CardRange instance) => <String, dynamic>{
      'id': instance.id,
      'gift_card_id': instance.giftCardId,
      'gift_card_country_id': instance.giftCardCountryId,
      'status': instance.status,
      'min': instance.min,
      'max': instance.max,
      'updated_by': instance.updatedBy,
      'receipt_categories': instance.receiptCategories,
    };

GiftCardCountry _$GiftCardCountryFromJson(Map<String, dynamic> json) =>
    GiftCardCountry(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      iso: json['iso'] as String,
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      ranges: (json['ranges'] as List<dynamic>)
          .map((e) => CardRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GiftCardCountryToJson(GiftCardCountry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'image': instance.image,
      'iso': instance.iso,
      'currency': instance.currency,
      'ranges': instance.ranges,
    };

GiftCardModel _$GiftCardModelFromJson(Map<String, dynamic> json) =>
    GiftCardModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      brandLogo: json['brand_logo'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      confirmMin: (json['confirm_min'] as num).toInt(),
      confirmMax: (json['confirm_max'] as num).toInt(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => GiftCardCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GiftCardModelToJson(GiftCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'brand_logo': instance.brandLogo,
      'status': instance.status,
      'created_at': instance.createdAt,
      'confirm_min': instance.confirmMin,
      'confirm_max': instance.confirmMax,
      'countries': instance.countries,
    };

GiftCardRatesResponse _$GiftCardRatesResponseFromJson(
        Map<String, dynamic> json) =>
    GiftCardRatesResponse(
      message: json['message'] as String,
      allGiftcards: (json['all_giftcards'] as List<dynamic>)
          .map((e) => GiftCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GiftCardRatesResponseToJson(
        GiftCardRatesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'all_giftcards': instance.allGiftcards,
    };

GiftCardCalculateRequest _$GiftCardCalculateRequestFromJson(
        Map<String, dynamic> json) =>
    GiftCardCalculateRequest(
      giftCardId: (json['gift_card_id'] as num).toInt(),
      countryId: (json['country_id'] as num).toInt(),
      rangeId: (json['range_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      action: json['action'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$GiftCardCalculateRequestToJson(
        GiftCardCalculateRequest instance) =>
    <String, dynamic>{
      'gift_card_id': instance.giftCardId,
      'country_id': instance.countryId,
      'range_id': instance.rangeId,
      'category_id': instance.categoryId,
      'action': instance.action,
      'amount': instance.amount,
    };

GiftCardCalculateResponse _$GiftCardCalculateResponseFromJson(
        Map<String, dynamic> json) =>
    GiftCardCalculateResponse(
      action: json['action'] as String,
      giftCard: json['gift_card'] as Map<String, dynamic>,
      country: json['country'] as Map<String, dynamic>,
      range: json['range'] as Map<String, dynamic>,
      category: json['category'] as Map<String, dynamic>,
      cardAmount: (json['card_amount'] as num).toDouble(),
      cardCurrency: json['card_currency'] as String,
      rate: json['rate'] as String,
      totalValue: json['total_value'] as String,
      exchangeValueNgn: (json['exchange_value_ngn'] as num).toDouble(),
      disclaimer: json['disclaimer'] as String,
    );

Map<String, dynamic> _$GiftCardCalculateResponseToJson(
        GiftCardCalculateResponse instance) =>
    <String, dynamic>{
      'action': instance.action,
      'gift_card': instance.giftCard,
      'country': instance.country,
      'range': instance.range,
      'category': instance.category,
      'card_amount': instance.cardAmount,
      'card_currency': instance.cardCurrency,
      'rate': instance.rate,
      'total_value': instance.totalValue,
      'exchange_value_ngn': instance.exchangeValueNgn,
      'disclaimer': instance.disclaimer,
    };
