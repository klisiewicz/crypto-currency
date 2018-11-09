import 'package:crypto_currency/crypto/cache/cache_policy.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';

class CryptoCurrencyRestRepository implements CryptoCurrencyRateRepository {
  final CryptoCurrencyRateService cryptoCurrencyRateService;
  final CryptoCurrencyRateDao cryptoCurrencyRateDao;
  final CachePolicy cache;

  CryptoCurrencyRestRepository(this.cryptoCurrencyRateService,
      this.cryptoCurrencyRateDao, this.cache)
      : assert(cryptoCurrencyRateService != null),
        assert(cryptoCurrencyRateService != null),
        assert(cache != null);

  @override
  Future<Iterable<CryptoCurrencyRate>> findAll() async {
    try {
      if (cache.isValid())
        return _fetchFromLocalStorage();
      else
        return await _fetchFromService();
    } catch (e) {
      return _fetchFromLocalStorage();
    }
  }

  Future<Iterable<CryptoCurrencyRate>> _fetchFromService() async {
    final cryptoCurrencyRates = await cryptoCurrencyRateService.fetchAll();
    await cryptoCurrencyRateDao.saveAll(cryptoCurrencyRates);
    return cryptoCurrencyRates;
  }

  Future<Iterable<CryptoCurrencyRate>> _fetchFromLocalStorage() async {
    return cryptoCurrencyRateDao.getAll();
  }
}
