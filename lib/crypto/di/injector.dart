import 'package:crypto_currency/crypto/domain/crypto_currency_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rest_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_service.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';
import 'package:http/http.dart' as http;

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(http.Client)
  @Register.factory(CryptoCurrencyService, from: CoinMarketCapCurrencyService)
  @Register.singleton(CryptoCurrencyRepository, from: CryptoCurrencyRestRepository)
  void configure();
}

void inject() {
  new _$Injector().configure();
}