import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_repository.dart';

class CryptoCurrencyMockRepository implements CryptoCurrencyRepository {
  @override
  Future<Iterable<CryptoCurrency>> findAll() =>
    Future.value([
      CryptoCurrency(id: 1, name: 'Bitcoin', symbol: 'BTC'),
      CryptoCurrency(id: 2, name: 'Litecoin', symbol: 'LTC'),
    ]);
}