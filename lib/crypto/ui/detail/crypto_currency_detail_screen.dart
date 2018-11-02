import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyDetailScreen extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;

  const CryptoCurrencyDetailScreen({Key key, @required this.cryptoCurrencyRate})
      : assert(cryptoCurrencyRate != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      );

  Widget _buildAppBar() {
    return new AppBar(
      title: new Text(cryptoCurrencyRate.cryptoCurrency.name),
    );
  }

  Widget _buildBody() => Container();
}
