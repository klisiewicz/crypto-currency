import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateRepository {
  Future<List<CryptoCurrencyRate>> getAll();

  Future<List<CryptoCurrencyRate>> getBy(String query);
}
