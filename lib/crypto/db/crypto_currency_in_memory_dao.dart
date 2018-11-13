import 'package:crypto_currency/crypto/domain/crypto_currency_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

class CryptoCurrencyRateInMemoryDao implements CryptoCurrencyRateDao {
  final List<CryptoCurrencyRate> _currencies = [];

  @override
  Future<Iterable<CryptoCurrencyRate>> getAll() =>
      Future.value(List.unmodifiable(_currencies));

  @override
  Future<Iterable<CryptoCurrencyRate>> getByName(String name) =>
      Future.value(List.unmodifiable(_currencies.where((cryptoCurrency) =>
          cryptoCurrency.cryptoCurrency.name
              .toLowerCase()
              .contains(name.toLowerCase()) ||
          cryptoCurrency.cryptoCurrency.symbol
              .toLowerCase()
              .contains(name.toLowerCase()))));

  @override
  Future<Null> saveAll(Iterable<CryptoCurrencyRate> currencies) {
    _currencies
      ..clear()
      ..addAll(currencies);
    return Future.value(null);
  }
}
