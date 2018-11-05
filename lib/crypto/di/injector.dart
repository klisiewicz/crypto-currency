import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_rest_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_service.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(http.Client)
  @Register.factory(
      CryptoCurrencyRateService, from: CoinMarketCapCurrencyService)
  @Register.singleton(
      CryptoCurrencyRateRepository, from: CryptoCurrencyRestRepository)
  void configure();
}

void inject() {
  new _$Injector().configure();
}