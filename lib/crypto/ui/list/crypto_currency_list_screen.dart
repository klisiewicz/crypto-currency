import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/ui/detail/crypto_currency_detail_screen.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CryptoCurrencyListScreen extends StatelessWidget {
  final CryptoCurrencyRateRepository _cryptoCurrencyRepository =
  new kiwi.Container()<CryptoCurrencyRateRepository>();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      );

  Widget _buildAppBar(BuildContext context) =>
      AppBar(
        title: Text('Cryptocurrencies'),
      );

  Widget _buildBody() {
    return FutureBuilder<Iterable<CryptoCurrencyRate>>(
      future: _cryptoCurrencyRepository.findAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _buildFromSnapshot(context, snapshot);
      },
    );
  }

  Widget _buildFromSnapshot(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData)
        return CryptoCurrencyList(
          cryptoCurrencies: snapshot.data.toList(),
          onValueSelected: (CryptoCurrencyRate cryptoCurrency) {
            _navigateToCryptoCurrencyDetails(cryptoCurrency, context);
          },
        );
      else
        return SnackBar(
          content: Text(snapshot.error.toString()),
        );
    } else {
      return LinearProgressIndicator();
    }
  }

  void _navigateToCryptoCurrencyDetails(CryptoCurrencyRate value,
      BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) =>
              CryptoCurrencyDetailScreen(
                cryptoCurrencyRate: value,
              )),
    );
  }
}
