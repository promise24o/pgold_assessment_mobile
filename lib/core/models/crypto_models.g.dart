// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoNetwork _$CryptoNetworkFromJson(Map<String, dynamic> json) =>
    CryptoNetwork(
      id: (json['id'] as num).toInt(),
      addressRegex: json['addressRegex'] as String?,
      memoRegex: json['memoRegex'] as String?,
      name: json['name'] as String,
      code: json['code'] as String,
      fee: json['fee'] as String,
      feeType: json['feeType'] as String,
      minimum: json['minimum'] as String,
      contractAddress: json['contractAddress'] as String?,
      explorerLink: json['explorerLink'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$CryptoNetworkToJson(CryptoNetwork instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressRegex': instance.addressRegex,
      'memoRegex': instance.memoRegex,
      'name': instance.name,
      'code': instance.code,
      'fee': instance.fee,
      'feeType': instance.feeType,
      'minimum': instance.minimum,
      'contractAddress': instance.contractAddress,
      'explorerLink': instance.explorerLink,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      icon: json['icon'] as String,
      networks: (json['networks'] as List<dynamic>)
          .map((e) => CryptoNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isStable: (json['is_stable'] as num).toInt(),
      color: json['color'] as String,
      minimumDeposit: json['minimumDeposit'] as String,
      maximumDecimalPlaces: (json['maximumDecimalPlaces'] as num).toInt(),
      showBuy: json['show_buy'] as bool,
      buyRate: json['buy_rate'] as String,
      sellRate: json['sell_rate'] as String,
      usdRate: json['usd_rate'] as String,
    );

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'icon': instance.icon,
      'networks': instance.networks,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_stable': instance.isStable,
      'color': instance.color,
      'minimumDeposit': instance.minimumDeposit,
      'maximumDecimalPlaces': instance.maximumDecimalPlaces,
      'show_buy': instance.showBuy,
      'buy_rate': instance.buyRate,
      'sell_rate': instance.sellRate,
      'usd_rate': instance.usdRate,
    };

CryptoRatesResponse _$CryptoRatesResponseFromJson(Map<String, dynamic> json) =>
    CryptoRatesResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CryptoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoRatesResponseToJson(
        CryptoRatesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

CryptoCalculateRequest _$CryptoCalculateRequestFromJson(
        Map<String, dynamic> json) =>
    CryptoCalculateRequest(
      code: json['code'] as String,
      action: json['action'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      usdValue: (json['usd_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CryptoCalculateRequestToJson(
        CryptoCalculateRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'action': instance.action,
      'amount': instance.amount,
      'usd_value': instance.usdValue,
    };

CryptoCalculateResponse _$CryptoCalculateResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoCalculateResponse(
      action: json['action'] as String,
      asset: json['asset'] as Map<String, dynamic>,
      cryptoAmount: (json['crypto_amount'] as num).toDouble(),
      usdValue: (json['usd_value'] as num).toDouble(),
      rate: json['rate'] as String,
      buyRate: (json['buy_rate'] as num).toDouble(),
      sellRate: (json['sell_rate'] as num).toDouble(),
      appliedRate: (json['applied_rate'] as num).toDouble(),
      totalValue: json['total_value'] as String,
      exchangeValueNgn: (json['exchange_value_ngn'] as num).toDouble(),
      disclaimer: json['disclaimer'] as String,
      networks: (json['networks'] as List<dynamic>)
          .map((e) => CryptoNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoCalculateResponseToJson(
        CryptoCalculateResponse instance) =>
    <String, dynamic>{
      'action': instance.action,
      'asset': instance.asset,
      'crypto_amount': instance.cryptoAmount,
      'usd_value': instance.usdValue,
      'rate': instance.rate,
      'buy_rate': instance.buyRate,
      'sell_rate': instance.sellRate,
      'applied_rate': instance.appliedRate,
      'total_value': instance.totalValue,
      'exchange_value_ngn': instance.exchangeValueNgn,
      'disclaimer': instance.disclaimer,
      'networks': instance.networks,
    };
