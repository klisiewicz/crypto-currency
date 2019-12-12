import 'dart:collection';

import 'package:crypto_currency/src/domain/crypto_currency_rate_data_storage.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';

class CryptoCurrencyRateInMemoryDao implements CryptoCurrencyRateDataStorage {
  final List<CryptoCurrencyRate> _currencies = [];

  @override
  Future<List<CryptoCurrencyRate>> getAll() async =>
      UnmodifiableListView(_currencies);

  @override
  Future<List<CryptoCurrencyRate>> getByName(String name) async =>
      UnmodifiableListView(
        _currencies.where((cryptoCurrency) =>
            cryptoCurrency.cryptoCurrency.name
                .toLowerCase()
                .contains(name.toLowerCase()) ||
            cryptoCurrency.cryptoCurrency.symbol
                .toLowerCase()
                .contains(name.toLowerCase())),
      );

  @override
  Future<void> saveAll(List<CryptoCurrencyRate> currencies) async {
    _currencies
      ..clear()
      ..addAll(currencies);
  }
}
