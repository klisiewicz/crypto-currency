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
        .registerSingleton<CryptoCurrencyService, CoinMarketCapCurrencyService>(
            (c) => CoinMarketCapCurrencyService(c<Client>()));
    container.registerSingleton<CryptoCurrencyRepository,
            CryptoCurrencyRestRepository>(
        (c) => CryptoCurrencyRestRepository(c<CryptoCurrencyService>()));
  }
}
