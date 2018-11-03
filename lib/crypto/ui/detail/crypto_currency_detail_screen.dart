import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
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

  Widget _buildAppBar() {
    return new AppBar(
      title: new Text(cryptoCurrencyRate.cryptoCurrency.name),
    );
  }

  Widget _buildBody(BuildContext context) =>
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildLabeledTextField(
                  'Symbol', cryptoCurrencyRate.cryptoCurrency.symbol),
              _buildLabeledTextField(
                  'Name', cryptoCurrencyRate.cryptoCurrency.name),
            ],
          ),
        ),
      );

  Widget _buildLabeledTextField(String label, String text) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Name',
        enabled: false,
      ),
      controller: TextEditingController(text: text),
    );
  }
}
