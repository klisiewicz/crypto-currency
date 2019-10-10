import 'package:crypto_currency/crypto/cache/cache_policy.dart';
import 'package:crypto_currency/crypto/cache/cache_time_policy.dart';
import 'package:crypto_currency/crypto/db/crypto_currency_in_memory_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_dao.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_bloc.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_cache_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:crypto_currency/crypto/time/date_time_now_provider.dart';
import 'package:crypto_currency/crypto/time/date_time_provider.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(http.Client)
  @Register.factory(
    CryptoCurrencyRateService,
    from: CoinMarketCapCurrencyService,
  )
  @Register.factory(
    CryptoCurrencyRateDao,
    from: CryptoCurrencyRateInMemoryDao,
  )
  @Register.factory(
    DateTimeProvider,
    from: DateTimeNowProvider,
  )
  @Register.factory(
    CachePolicy,
    from: CacheTimePolicy,
  )
  @Register.singleton(
    CryptoCurrencyRateRepository,
    from: CryptoCurrencyCacheRepository,
  )
  @Register.factory(CryptoCurrencyRateBloc)
  void configure();

  static void inject() {
    _$Injector().configure();
  }
}

T inject<T>([String name]) => Container().resolve<T>(name);