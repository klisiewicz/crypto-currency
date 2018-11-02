// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void configure() {
    final Container container = Container();
    container.registerFactory((c) => Client());
    container
        .registerFactory<CryptoCurrencyRateService,
        CoinMarketCapCurrencyService>(
            (c) => CoinMarketCapCurrencyService(c<Client>()));
    container.registerSingleton<CryptoCurrencyRateRepository,
            CryptoCurrencyRestRepository>(
            (c) =>
            CryptoCurrencyRestRepository(c<CryptoCurrencyRateService>()));
  }
}
