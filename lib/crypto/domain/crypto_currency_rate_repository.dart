import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateRepository {
  Future<Iterable<CryptoCurrencyRate>> findAll();

  Future<Iterable<CryptoCurrencyRate>> findByQuery(String query);
}
