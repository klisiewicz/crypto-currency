import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateDao {
  Future<List<CryptoCurrencyRate>> getAll();

  Future<List<CryptoCurrencyRate>> getByName(String name);

  Future<void> saveAll(List<CryptoCurrencyRate> currencies);
}
