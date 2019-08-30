import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:flutter_bloc_patterns/filter_list.dart';

abstract class CryptoCurrencyRateRepository
    extends FilterRepository<CryptoCurrencyRate, String> {}
