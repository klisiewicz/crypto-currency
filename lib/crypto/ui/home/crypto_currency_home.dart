import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_repository.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rest_repository.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list.dart';
import 'package:crypto_currency/crypto/web/coin_market_cap_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoCurrencyHome extends StatelessWidget {
  final CryptoCurrencyRepository _cryptoCurrencyRepository =
      CryptoCurrencyRestRepository(CoinMarketCapCurrencyService(http.Client()));

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      );

  Widget _buildAppBar() {
    return new AppBar(
      title: new Text('Cryptocurrencies'),
    );
  }

  Widget _buildBody() => FutureBuilder<Iterable<CryptoCurrency>>(
        future: _cryptoCurrencyRepository.findAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData)
              return CryptoCurrencyList(
                cryptoCurrencies: snapshot.data.toList(),
              );
            else if (snapshot.hasError)
              return SnackBar(
                content: Text(snapshot.error.toString()),
              );
          } else {
            return LinearProgressIndicator();
          }
        },
      );
}
