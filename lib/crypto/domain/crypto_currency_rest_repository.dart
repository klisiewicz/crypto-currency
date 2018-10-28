import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';

class CryptoCurrencyRestRepository implements CryptoCurrencyRepository {
  final CryptoCurrencyService cryptoCurrencyService;

  CryptoCurrencyRestRepository(this.cryptoCurrencyService);

  @override
  Future<Iterable<CryptoCurrency>> findAll() {
    return cryptoCurrencyService.fetchAll();
  }

}