import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateDao {
  Future<Iterable<CryptoCurrencyRate>> getAll();

  Future<Iterable<CryptoCurrencyRate>> getByName(String name);

  Future<Null> saveAll(Iterable<CryptoCurrencyRate> currencies);
}
