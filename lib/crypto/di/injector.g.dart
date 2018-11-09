// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void configure() {
    final Container container = Container();
    container.registerFactory((c) => Client());
    container.registerFactory<CryptoCurrencyRateService,
        CoinMarketCapCurrencyService>(
            (c) => CoinMarketCapCurrencyService(c<Client>()));
    container.registerFactory<CryptoCurrencyRateDao,
        CryptoCurrencyRateInMemoryDao>((c) => CryptoCurrencyRateInMemoryDao());
    container.registerFactory<CachePolicy, CacheTimePolicy>(
            (c) => CacheTimePolicy());
    container.registerSingleton<CryptoCurrencyRateRepository,
            CryptoCurrencyRestRepository>(
            (c) =>
            CryptoCurrencyRestRepository(c<CryptoCurrencyRateService>(),
                c<CryptoCurrencyRateDao>(), c<CachePolicy>()));
  }
}
