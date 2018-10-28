import 'package:crypto_currency/crypto/domain/crypto_currency.dart';

abstract class CryptoCurrencyRepository {
  Future<Iterable<CryptoCurrency>> findAll();
}
