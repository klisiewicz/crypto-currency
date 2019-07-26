import 'dart:collection';

import 'package:crypto_currency/crypto/domain/crypto_currency_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

class CryptoCurrencyRateInMemoryDao implements CryptoCurrencyRateDao {
  final List<CryptoCurrencyRate> _currencies = [];

  @override
  Future<Iterable<CryptoCurrencyRate>> getAll() async =>
      UnmodifiableListView(_currencies);

  @override
  Future<Iterable<CryptoCurrencyRate>> getByName(String name) async =>
      UnmodifiableListView(_currencies.where((cryptoCurrency) =>
      cryptoCurrency.cryptoCurrency.name
          .toLowerCase()
          .contains(name.toLowerCase()) ||
          cryptoCurrency.cryptoCurrency.symbol
              .toLowerCase()
              .contains(name.toLowerCase())));

  @override
  Future<void> saveAll(Iterable<CryptoCurrencyRate> currencies) async {
    _currencies
      ..clear()
      ..addAll(currencies);
  }
}
