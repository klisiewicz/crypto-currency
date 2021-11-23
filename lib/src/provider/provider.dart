import 'package:clock/clock.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_api_key_provider.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_asset_api_key_provider.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_data_source.dart';
import 'package:crypto_currency/src/data/cache/cache_policy.dart';
import 'package:crypto_currency/src/data/cache/cache_time_policy.dart';
import 'package:crypto_currency/src/data/db/crypto_currency_in_memory_dao.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_cache_repository.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_data_storage.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final _clientProvider = Provider.autoDispose<Client>((ref) {
  return Client();
});

final _clockProvider = Provider.autoDispose<Clock>((ref) {
  return const Clock();
});

final _cachePolicyProvider = Provider.autoDispose<CachePolicy>((ref) {
  return CacheTimePolicy(
    ref.watch(_clockProvider),
  );
});

final _apiKeyProvider =
    Provider.autoDispose<CoinMarketCapApiKeyProvider>((ref) {
  return CoinMarketCapAssetApiKeyProvider(rootBundle);
});

final _cryptoCurrencyRateDataSourceProvider =
    Provider.autoDispose<CryptoCurrencyRateDataSource>((ref) {
  return CoinMarketCapCryptoCurrencyDataSource(
    'pro-api.coinmarketcap.com',
    ref.watch(_clientProvider),
    ref.watch(_apiKeyProvider),
  );
});

final _cryptoCurrencyRateDataStorageProvider =
    Provider.autoDispose<CryptoCurrencyRateDataStorage>((ref) {
  return CryptoCurrencyRateInMemoryDao();
});

final _cryptoCurrencyRateRepositoryProvider =
    Provider.autoDispose<CryptoCurrencyRateRepository>((ref) {
  return CryptoCurrencyCacheRepository(
    ref.watch(_cryptoCurrencyRateDataSourceProvider),
    ref.watch(_cryptoCurrencyRateDataStorageProvider),
    ref.watch(_cachePolicyProvider),
  );
});

final cryptoCurrencyRates =
    FutureProvider.autoDispose<List<CryptoCurrencyRate>>((ref) {
  final repository = ref.watch(_cryptoCurrencyRateRepositoryProvider);
  return repository.getAll();
});
