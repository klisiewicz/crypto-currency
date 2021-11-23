import 'package:crypto_currency/src/data/api/coin_market_cap_api_key.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_not_found_error.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CoinMarketCapEnvApiKeyProvider implements CoinMarketCapApiKeyProvider {
  const CoinMarketCapEnvApiKeyProvider();

  @override
  Future<CoinMarketCapApiKey> getApiKey() async {
    await dotenv.load();
    final apiKey = dotenv.env['api_key'];
    if (apiKey == null) {
      throw CoinMarketCapApiKeyNotFoundError(
        'Missing env variable "api_key". Make sure, the the ".env" file exists and contains "api_key" variable.',
      );
    }
    return CoinMarketCapApiKey(apiKey);
  }
}
