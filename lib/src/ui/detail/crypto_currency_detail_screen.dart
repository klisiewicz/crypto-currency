import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_trend.dart';
import 'package:crypto_currency/src/ui/common/money_format.dart';
import 'package:crypto_currency/src/ui/common/trend_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoCurrencyDetailScreen extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;
  final NumberFormat numberFormat = NumberFormat.decimalPattern();
  final MoneyFormat moneyFormat = MoneyFormat();

  CryptoCurrencyDetailScreen(
    this.cryptoCurrencyRate, {
    Key key,
  })  : assert(cryptoCurrencyRate != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cryptoCurrencyRate.cryptoCurrency.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _LabeledTextField(
                label: 'Price',
                text: moneyFormat.format(cryptoCurrencyRate.price),
              ),
              _LabeledTextField(
                label: 'Market Cap',
                text: numberFormat.format(cryptoCurrencyRate.marketCap),
              ),
              const Divider(),
              _LabeledTextField(
                label: 'Circulating Supply',
                text:
                    '${numberFormat.format(cryptoCurrencyRate.supply.circulating)} ${cryptoCurrencyRate.cryptoCurrency.symbol}',
              ),
              if (cryptoCurrencyRate.supply.max != null)
                _LabeledTextField(
                  label: 'Max Supply',
                  text:
                      '${numberFormat.format(cryptoCurrencyRate.supply.max)} ${cryptoCurrencyRate.cryptoCurrency.symbol}',
                ),
              const Divider(),
              _TrendLabeledTextField(
                label: 'Change (1h)',
                trendValue: cryptoCurrencyRate.trendHistory.hour,
              ),
              _TrendLabeledTextField(
                label: 'Change (1d)',
                trendValue: cryptoCurrencyRate.trendHistory.day,
              ),
              _TrendLabeledTextField(
                label: 'Change (1w)',
                trendValue: cryptoCurrencyRate.trendHistory.week,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledTextField extends StatelessWidget {
  final String text;
  final String label;

  const _LabeledTextField({
    Key key,
    @required this.text,
    @required this.label,
  })  : assert(label != null),
        assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        enabled: false,
      ),
      initialValue: text,
    );
  }
}

class _TrendLabeledTextField extends StatelessWidget {
  final String label;
  final TrendValue trendValue;

  const _TrendLabeledTextField({
    Key key,
    @required this.label,
    @required this.trendValue,
  })  : assert(label != null),
        assert(trendValue != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        enabled: false,
        suffixIcon: TrendIcon(trendValue.trend),
      ),
      initialValue: '${trendValue.value.toStringAsFixed(2)} %',
    );
  }
}
