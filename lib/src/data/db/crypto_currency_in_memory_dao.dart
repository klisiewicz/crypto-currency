import 'dart:collection';

import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_data_storage.dart';

class CryptoCurrencyRateInMemoryDao implements CryptoCurrencyRateDataStorage {
  final List<CryptoCurrencyRate> _currencies = [];

  @override
  Future<List<CryptoCurrencyRate>> getAll() async =>
      UnmodifiableListView(_currencies);

  @override
  Future<List<CryptoCurrencyRate>> getByName(String name) async =>
      UnmodifiableListView(
        _currencies.where(
          (cryptoCurrency) => cryptoCurrency.isSatisfiedBy(name),
        ),
      );

  @override
  Future<void> saveAll(List<CryptoCurrencyRate> currencies) async {
    _currencies
      ..clear()
      ..addAll(currencies);
  }
}
