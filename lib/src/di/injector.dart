import 'package:clock/clock.dart';
import 'package:crypto_currency/src/data/api/coin_market_cap_data_source.dart';
import 'package:crypto_currency/src/data/cache/cache_policy.dart';
import 'package:crypto_currency/src/data/cache/cache_time_policy.dart';
import 'package:crypto_currency/src/data/db/crypto_currency_in_memory_dao.dart';
import 'package:crypto_currency/src/domain/bloc/crypto_currency_rate_bloc.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_cache_repository.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_data_storage.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/src/domain/repository/crypto_currency_reate_data_source.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(Client)
  @Register.singleton(Clock)
  @Register.factory(
    CryptoCurrencyRateDataSource,
    from: CoinMarketCapCryptoCurrencyDataSource,
  )
  @Register.factory(
    CryptoCurrencyRateDataStorage,
    from: CryptoCurrencyRateInMemoryDao,
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
