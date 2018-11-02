import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';

const bitcoinRate = CryptoCurrencyRate(
  cryptoCurrency: CryptoCurrency(id: 1, name: 'Bitcoin', symbol: 'BTC'),
  price: 9024.09,
  trend: Trend.falling,
);

const etherumRate = CryptoCurrencyRate(
  cryptoCurrency: CryptoCurrency(id: 1027, name: 'Ethereum', symbol: 'ETH'),
  price: 642.399,
  trend: Trend.falling,
);
