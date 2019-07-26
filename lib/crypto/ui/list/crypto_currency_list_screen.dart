import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_repository.dart';
import 'package:crypto_currency/crypto/ui/detail/crypto_currency_detail_screen.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CryptoCurrencyListScreen extends StatefulWidget {
  final CryptoCurrencyRateRepository _cryptoCurrencyRepository =
  new kiwi.Container()<CryptoCurrencyRateRepository>();

  @override
  _CryptoCurrencyListScreenState createState() =>
      _CryptoCurrencyListScreenState();
}

class _CryptoCurrencyListScreenState extends State<CryptoCurrencyListScreen> {
  List<CryptoCurrencyRate> cryptoCurrencyRates;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      );

  Widget _buildAppBar() => AppBar(title: Text('Cryptocurrencies'));

  Widget _buildBody() {
    return (cryptoCurrencyRates == null)
        ? _buildCryptoCurrencyListLoader()
        : _buildCryptoCurrencyList();
  }

  Widget _buildCryptoCurrencyListLoader() {
    return FutureBuilder<Iterable<CryptoCurrencyRate>>(
      future: widget._cryptoCurrencyRepository.findAll(),
      builder: _buildFromSnapshot,
    );
  }

  Widget _buildFromSnapshot(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        cryptoCurrencyRates = snapshot.data.toList();
        return _buildCryptoCurrencyList();
      } else
        return SnackBar(
          content: Text(snapshot.error.toString()),
        );
    } else {
      return LinearProgressIndicator();
    }
  }

  Widget _buildCryptoCurrencyList() =>
      RefreshIndicator(
        onRefresh: _refreshCurrencyRates,
        child: CryptoCurrencyList(
          cryptoCurrencies: cryptoCurrencyRates,
          onValueSelected: _navigateToCryptoCurrencyDetails,
        ),
      );

  Future<Null> _refreshCurrencyRates() async {
    final updatedCryptoCurrencyRates =
    await widget._cryptoCurrencyRepository.findAll();
    setState(() {
      cryptoCurrencyRates = updatedCryptoCurrencyRates.toList();
    });
  }

  void _navigateToCryptoCurrencyDetails(CryptoCurrencyRate value) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) =>
            CryptoCurrencyDetailScreen(cryptoCurrencyRate: value),
      ),
    );
  }
}
