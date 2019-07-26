import 'package:crypto_currency/crypto/cache/cache_policy.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';

import 'crypto_currency_rate_repository.dart';

class CryptoCurrencyRestRepository implements CryptoCurrencyRateRepository {
  final CryptoCurrencyRateService cryptoCurrencyRateService;
  final CryptoCurrencyRateDao cryptoCurrencyRateDao;
  final CachePolicy cache;

  CryptoCurrencyRestRepository(
    this.cryptoCurrencyRateService,
    this.cryptoCurrencyRateDao,
    this.cache,
  )   : assert(cryptoCurrencyRateService != null),
        assert(cryptoCurrencyRateService != null),
        assert(cache != null);

  @override
  Future<List<CryptoCurrencyRate>> getAll() async {
    try {
      return (cache.isValid()) ? _fetchFromLocalStorage() : _fetchFromService();
    } catch (e) {
      return _fetchFromLocalStorage();
    }
  }

  Future<List<CryptoCurrencyRate>> _fetchFromService() async {
    final cryptoCurrencyRates = await cryptoCurrencyRateService.fetchAll();
    await cryptoCurrencyRateDao.saveAll(cryptoCurrencyRates);
    return cryptoCurrencyRates;
  }

  Future<List<CryptoCurrencyRate>> _fetchFromLocalStorage() =>
      cryptoCurrencyRateDao.getAll();

  @override
  Future<List<CryptoCurrencyRate>> getBy(String query) async {
    final cryptoCurrencyRates = await cryptoCurrencyRateService.fetchAll();

    return (isNotNullOrEmpty(query))
        ? cryptoCurrencyRates.where(
            (CryptoCurrencyRate rate) => _matchesQuery(rate, query),
          )
        : cryptoCurrencyRates;
  }

  bool _matchesQuery(CryptoCurrencyRate rate, String query) {
    return _nameContainsQuery(rate, query) || _symbolContainsQuery(rate, query);
  }

  bool isNotNullOrEmpty(String query) => query != null && query.isNotEmpty;

  bool _nameContainsQuery(CryptoCurrencyRate rate, String query) =>
      rate.cryptoCurrency.name.toLowerCase().contains(query.toLowerCase());

  bool _symbolContainsQuery(CryptoCurrencyRate rate, String query) =>
      rate.cryptoCurrency.symbol.toLowerCase().contains(query.toLowerCase());
}
