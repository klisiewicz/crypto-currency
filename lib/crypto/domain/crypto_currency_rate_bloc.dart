import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class CryptoCurrencyRateBloc extends ListBloc<CryptoCurrencyRate> {
  CryptoCurrencyRateBloc(CryptoCurrencyRateRepository repository) : super(repository);
}