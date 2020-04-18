import 'package:crypto_currency/src/data/api/coin_market_cap_api_key.dart';

abstract class CoinMarketCapApiKeyProvider {
  Future<CoinMarketCapApiKey> getApiKey();
}
