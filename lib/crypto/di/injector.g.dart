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
    container.registerFactory<DateTimeProvider, DateTimeNowProvider>(
        (c) => DateTimeNowProvider());
    container.registerFactory<CachePolicy, CacheTimePolicy>(
        (c) => CacheTimePolicy(c<DateTimeProvider>()));
    container.registerSingleton<CryptoCurrencyRateRepository,
            CryptoCurrencyCacheRepository>(
        (c) => CryptoCurrencyCacheRepository(c<CryptoCurrencyRateService>(),
            c<CryptoCurrencyRateDao>(), c<CachePolicy>()));
    container.registerFactory(
        (c) => CryptoCurrencyRateBloc(c<CryptoCurrencyRateRepository>()));
  }
}
