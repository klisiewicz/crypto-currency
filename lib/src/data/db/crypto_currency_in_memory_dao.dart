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
          (cryptoCurrency) =>
              cryptoCurrency._matchesName(name) ||
              cryptoCurrency._matchesSymbol(name),
        ),
      );

  @override
  Future<void> saveAll(List<CryptoCurrencyRate> currencies) async {
    _currencies
      ..clear()
      ..addAll(currencies);
  }
}

extension on CryptoCurrencyRate {
  bool _matchesName(String value) {
    return cryptoCurrency.name.toLowerCase().contains(value.toLowerCase());
  }

  bool _matchesSymbol(String value) {
    return cryptoCurrency.symbol.toLowerCase().contains(value.toLowerCase());
  }
}
