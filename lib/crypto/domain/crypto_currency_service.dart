import 'package:crypto_currency/crypto/domain/crypto_currency.dart';

abstract class CryptoCurrencyService {
  Future<Iterable<CryptoCurrency>> fetchAll();
}
