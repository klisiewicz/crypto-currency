import 'package:crypto_currency/src/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class CryptoCurrencyRateBloc extends ListBloc<CryptoCurrencyRate> {
  CryptoCurrencyRateBloc(CryptoCurrencyRateRepository repository) : super(repository);
}