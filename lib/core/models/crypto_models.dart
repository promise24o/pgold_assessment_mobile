import 'package:json_annotation/json_annotation.dart';

part 'crypto_models.g.dart';

// Crypto Network Model
@JsonSerializable()
class CryptoNetwork {
  final int id;
  @JsonKey(name: 'addressRegex')
  final String? addressRegex;
  @JsonKey(name: 'memoRegex')
  final String? memoRegex;
  final String name;
  final String code;
  final String fee;
  @JsonKey(name: 'feeType')
  final String feeType;
  final String minimum;
  @JsonKey(name: 'contractAddress')
  final String? contractAddress;
  @JsonKey(name: 'explorerLink')
  final String? explorerLink;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  CryptoNetwork({
    required this.id,
    this.addressRegex,
    this.memoRegex,
    required this.name,
    required this.code,
    required this.fee,
    required this.feeType,
    required this.minimum,
    this.contractAddress,
    this.explorerLink,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CryptoNetwork.fromJson(Map<String, dynamic> json) =>
      _$CryptoNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoNetworkToJson(this);
}

// Crypto Model
@JsonSerializable()
class CryptoModel {
  final int id;
  final String name;
  final String code;
  final String icon;
  final List<CryptoNetwork> networks;
  final int status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'is_stable')
  final int isStable;
  final String color;
  @JsonKey(name: 'minimumDeposit')
  final String minimumDeposit;
  @JsonKey(name: 'maximumDecimalPlaces')
  final int maximumDecimalPlaces;
  @JsonKey(name: 'show_buy')
  final bool showBuy;
  @JsonKey(name: 'buy_rate')
  final String buyRate;
  @JsonKey(name: 'sell_rate')
  final String sellRate;
  @JsonKey(name: 'usd_rate')
  final String usdRate;

  CryptoModel({
    required this.id,
    required this.name,
    required this.code,
    required this.icon,
    required this.networks,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isStable,
    required this.color,
    required this.minimumDeposit,
    required this.maximumDecimalPlaces,
    required this.showBuy,
    required this.buyRate,
    required this.sellRate,
    required this.usdRate,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}

// Crypto Rates Response
@JsonSerializable()
class CryptoRatesResponse {
  final String message;
  final List<CryptoModel> data;

  CryptoRatesResponse({
    required this.message,
    required this.data,
  });

  factory CryptoRatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoRatesResponseFromJson(json);
}

// Crypto Calculate Request
@JsonSerializable()
class CryptoCalculateRequest {
  final String code;
  final String action;
  final double? amount;
  @JsonKey(name: 'usd_value')
  final double? usdValue;

  CryptoCalculateRequest({
    required this.code,
    required this.action,
    this.amount,
    this.usdValue,
  });

  Map<String, dynamic> toJson() => _$CryptoCalculateRequestToJson(this);
}

// Crypto Calculate Response
@JsonSerializable()
class CryptoCalculateResponse {
  final String action;
  final Map<String, dynamic> asset;
  @JsonKey(name: 'crypto_amount')
  final double cryptoAmount;
  @JsonKey(name: 'usd_value')
  final double usdValue;
  final String rate;
  @JsonKey(name: 'buy_rate')
  final double buyRate;
  @JsonKey(name: 'sell_rate')
  final double sellRate;
  @JsonKey(name: 'applied_rate')
  final double appliedRate;
  @JsonKey(name: 'total_value')
  final String totalValue;
  @JsonKey(name: 'exchange_value_ngn')
  final double exchangeValueNgn;
  final String disclaimer;
  final List<CryptoNetwork> networks;

  CryptoCalculateResponse({
    required this.action,
    required this.asset,
    required this.cryptoAmount,
    required this.usdValue,
    required this.rate,
    required this.buyRate,
    required this.sellRate,
    required this.appliedRate,
    required this.totalValue,
    required this.exchangeValueNgn,
    required this.disclaimer,
    required this.networks,
  });

  factory CryptoCalculateResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoCalculateResponseFromJson(json);
}
