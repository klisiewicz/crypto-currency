import 'package:crypto_currency/src/data/cache/cache_policy.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_data_storage.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_reate_data_source.dart';
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
      return await _tryToGetRates();
    } catch (e) {
      final storedRates = await cryptoCurrencyRateDataStorage.getAll();
      if (storedRates.isNotEmpty) {
        return storedRates;
      } else {
        rethrow;
      }
    }
  }

  Future<List<CryptoCurrencyRate>> _tryToGetRates() async {
    if (cache.isValid()) {
      return cryptoCurrencyRateDataStorage.getAll();
    } else {
      final rates = await cryptoCurrencyRateDataSource.getAll();
      unawaited(cryptoCurrencyRateDataStorage.saveAll(rates));
      return rates;
    }
  }

  @override
  Future<List<CryptoCurrencyRate>> getBy(String query) async {
    final cryptoCurrencyRates = await cryptoCurrencyRateDataSource.getAll();

    return query.isNotNullOrEmpty
        ? cryptoCurrencyRates
            .where((rate) => rate.isSatisfiedBy(query))
            .toList()
        : cryptoCurrencyRates;
  }
}

extension StringExt on String {
  bool get isNotNullOrEmpty => this != null && isNotEmpty;
}
