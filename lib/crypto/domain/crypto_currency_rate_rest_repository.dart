import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';

class CryptoCurrencyRestRepository implements CryptoCurrencyRateRepository {
  final CryptoCurrencyRateService cryptoCurrencyRateService;

  CryptoCurrencyRestRepository(this.cryptoCurrencyRateService)
      : assert(cryptoCurrencyRateService != null);

  @override
  Future<Iterable<CryptoCurrencyRate>> findAll() {
    return cryptoCurrencyRateService.fetchAll();
  }
}
