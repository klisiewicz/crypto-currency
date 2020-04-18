import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateDataSource {
  Future<List<CryptoCurrencyRate>> getAll();
}
