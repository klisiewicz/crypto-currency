import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_provider.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_asset_api_key_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../util/mocktail_ext.dart';

class AssetBundleMock extends Mock implements AssetBundle {}

void main() {
  late AssetBundle assetBundle;
  late CoinMarketCapApiKeyProvider coinMarketCapApiKeyProvider;

  setUp(() {
    assetBundle = AssetBundleMock();
    coinMarketCapApiKeyProvider = CoinMarketCapAssetApiKeyProvider(assetBundle);
  });

  test('should get keys from asset bundle', () async {
    when(
      () => assetBundle.loadString(CoinMarketCapAssetApiKeyProvider.keysPath),
    ).thenAnswerFutureValue(keysJson);

    final apiKey = await coinMarketCapApiKeyProvider.getApiKey();

    expect(apiKey.value, equals('my-secret-api-key'));
  });
}

const keysJson = '''
{
  "api_key": "my-secret-api-key"
}
''';
