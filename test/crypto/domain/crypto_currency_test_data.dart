import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_supply.dart';

const bitcoinRate = CryptoCurrencyRate(
  cryptoCurrency: CryptoCurrency(id: 1, name: 'Bitcoin', symbol: 'BTC'),
  price: 9024.09,
  marketCap: 153483184623.0,
  supply: Supply(
      circulating: 17008162.0,
      max: 21000000.0
  ),
  trendValue: TrendValue(
      value: 2.31,
      trend: Trend.falling
  ),
);

const etherumRate = CryptoCurrencyRate(
  cryptoCurrency: CryptoCurrency(id: 1027, name: 'Ethereum', symbol: 'ETH'),
  price: 642.399,
  marketCap: 63695073558.0,
  supply: Supply(
    circulating: 99151888.0,
    max: null,
  ),
  trendValue: TrendValue(
      value: 3.75,
      trend: Trend.falling
  ),
);
