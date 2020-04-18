import 'dart:convert';

import 'package:crypto_currency/src/data/api/coin_market_cap_api_key.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_provider.dart';
import 'package:flutter/services.dart';

class CoinMarketCapAssetApiKeyProvider implements CoinMarketCapApiKeyProvider {
  static const String keysPath = 'assets/secrets/api_key.json';

  final AssetBundle _assetBundle;

  CoinMarketCapAssetApiKeyProvider(this._assetBundle);

  @override
  Future<CoinMarketCapApiKey> getApiKey() async {
    final jsonString = await _assetBundle.loadString(keysPath);
    final decodedJson = json.decode(jsonString);
    return CoinMarketCapApiKey(decodedJson['api_key'] as String);
  }
}
