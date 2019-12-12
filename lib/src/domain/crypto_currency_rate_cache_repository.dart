import 'package:crypto_currency/src/data/cache/cache_policy.dart';
import 'package:crypto_currency/src/domain/crypto_currency_rate_data_storage.dart';
import 'package:crypto_currency/src/domain/crypto_currency_reate_data_source.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:pedantic/pedantic.dart';

import 'crypto_currency_rate_repository.dart';

class CryptoCurrencyCacheRepository implements CryptoCurrencyRateRepository {
  final CryptoCurrencyRateDataSource cryptoCurrencyRateDataSource;
  final CryptoCurrencyRateDataStorage cryptoCurrencyRateDataStorage;
  final CachePolicy cache;

  CryptoCurrencyCacheRepository(
    this.cryptoCurrencyRateDataSource,
    this.cryptoCurrencyRateDataStorage,
    this.cache,
  )   : assert(cryptoCurrencyRateDataSource != null),
        assert(cryptoCurrencyRateDataStorage != null),
        assert(cache != null);

  @override
  Future<List<CryptoCurrencyRate>> getAll() async {
    try {
      if (cache.isValid()) {
        return cryptoCurrencyRateDataStorage.getAll();
      } else {
        final cryptoCurrencyRates = await cryptoCurrencyRateDataSource.getAll();
        unawaited(cryptoCurrencyRateDataStorage.saveAll(cryptoCurrencyRates));
        return cryptoCurrencyRates;
      }
    } catch (e) {
      return cryptoCurrencyRateDataStorage.getAll();
    }
  }

  @override
  Future<List<CryptoCurrencyRate>> getBy(String query) async {
    final cryptoCurrencyRates = await cryptoCurrencyRateDataSource.getAll();

    return (query.isNotNullOrEmpty)
        ? cryptoCurrencyRates
            .where((rate) => rate.isSatisfiedBy(query))
            .toList()
        : cryptoCurrencyRates;
  }
}

extension StringExt on String {
  bool get isNotNullOrEmpty => this != null && this.isNotEmpty;
}