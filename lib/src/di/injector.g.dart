// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void configure() {
    final Container container = Container();
    container.registerFactory((c) => Client());
    container.registerSingleton((c) => Clock());
    container.registerFactory<CryptoCurrencyRateDataSource,
            CoinMarketCapCryptoCurrencyDataSource>(
        (c) => CoinMarketCapCryptoCurrencyDataSource(c<Client>()));
    container.registerFactory<CryptoCurrencyRateDataStorage,
        CryptoCurrencyRateInMemoryDao>((c) => CryptoCurrencyRateInMemoryDao());
    container.registerFactory<CachePolicy, CacheTimePolicy>(
        (c) => CacheTimePolicy(c<Clock>()));
    container.registerSingleton<CryptoCurrencyRateRepository,
            CryptoCurrencyCacheRepository>(
        (c) => CryptoCurrencyCacheRepository(c<CryptoCurrencyRateDataSource>(),
            c<CryptoCurrencyRateDataStorage>(), c<CachePolicy>()));
    container.registerFactory(
        (c) => CryptoCurrencyRateBloc(c<CryptoCurrencyRateRepository>()));
  }
}
