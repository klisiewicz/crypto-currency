import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

abstract class CryptoCurrencyRateService {
  Future<List<CryptoCurrencyRate>> fetchAll();
}
