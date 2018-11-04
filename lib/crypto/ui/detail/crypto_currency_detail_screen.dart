import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_trend.dart';
import 'package:crypto_currency/crypto/ui/crypto_currency_trend_icon_builder.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyDetailScreen extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;

  const CryptoCurrencyDetailScreen({Key key, @required this.cryptoCurrencyRate})
      : assert(cryptoCurrencyRate != null),
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      );

  Widget _buildAppBar() =>
      new AppBar(
        title: new Text(cryptoCurrencyRate.cryptoCurrency.name),
      );

  Widget _buildBody(BuildContext context) =>
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _buildLabeledTextField(
                  'Price',
                  '${cryptoCurrencyRate.price.toStringAsFixed(4)} USD'),
              _buildLabeledTextField(
                  'Market Cap', cryptoCurrencyRate.marketCap.toString()),
              Divider(),
              _buildLabeledTextField('Circulating Supply',
                  '${cryptoCurrencyRate.supply.circulating
                      .toString()} ${cryptoCurrencyRate.cryptoCurrency
                      .symbol}'),
              _buildLabeledTextField('Max Supply',
                  '${cryptoCurrencyRate.supply.max
                      .toString()} ${cryptoCurrencyRate.cryptoCurrency
                      .symbol}'),
              Divider(),
              _buildTrendLabeledTextField(
                  context, 'Change (1h)', cryptoCurrencyRate.trendHistory.hour),
              _buildTrendLabeledTextField(
                  context, 'Change (1d)', cryptoCurrencyRate.trendHistory.day),
              _buildTrendLabeledTextField(
                  context, 'Change (1w)', cryptoCurrencyRate.trendHistory.week),
            ],
          ),
        ),
      );

  Widget _buildLabeledTextField(String label, String text) =>
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          enabled: false,
        ),
        controller: TextEditingController(text: text),
      );

  Widget _buildTrendLabeledTextField(BuildContext context, String label,
      TrendValue trendValue) =>
      TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            enabled: false,
            suffixIcon: buildTrendIcon(context, trendValue.trend)),
        controller: TextEditingController(
            text: '${trendValue.value.toStringAsFixed(2)} %'),
      );
}
