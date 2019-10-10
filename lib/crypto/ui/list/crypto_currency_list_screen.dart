import 'package:crypto_currency/crypto/di/injector.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_bloc.dart';
import 'package:crypto_currency/crypto/navigation/router.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class CryptoCurrencyListScreen extends StatefulWidget {
  @override
  _CryptoCurrencyListScreenState createState() =>
      _CryptoCurrencyListScreenState();
}

class _CryptoCurrencyListScreenState extends State<CryptoCurrencyListScreen> {
  final _cryptoCurrencyBloc = inject()<CryptoCurrencyRateBloc>();

  @override
  void initState() {
    super.initState();
    _cryptoCurrencyBloc.loadElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cryptocurrencies')),
      body: ViewStateBuilder<List<CryptoCurrencyRate>, CryptoCurrencyRateBloc>(
        bloc: _cryptoCurrencyBloc,
        onLoading: (context) => LinearProgressIndicator(),
        onSuccess: (context, cryptoCurrencies) => CryptoCurrencyList(
          cryptoCurrencies: cryptoCurrencies,
          onValueSelected: _navigateToCryptoCurrencyDetails,
          onRefresh: _cryptoCurrencyBloc.refreshElements,
        ),
        onRefreshing: (context, cryptoCurrencies) =>
            CryptoCurrencyList(cryptoCurrencies: cryptoCurrencies),
      ),
    );
  }

  void _navigateToCryptoCurrencyDetails(CryptoCurrencyRate value) =>
      Navigator.pushNamed(context, Routes.details, arguments: value);

  @override
  void dispose() {
    _cryptoCurrencyBloc.dispose();
    super.dispose();
  }
}
