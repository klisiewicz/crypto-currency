import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/domain/crypto_currency_rate_bloc.dart';
import 'package:crypto_currency/crypto/ui/detail/crypto_currency_detail_screen.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/filter_list.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CryptoCurrencyListScreen extends StatefulWidget {
  @override
  _CryptoCurrencyListScreenState createState() =>
      _CryptoCurrencyListScreenState();
}

class _CryptoCurrencyListScreenState extends State<CryptoCurrencyListScreen> {
  final _cryptoCurrencyBloc = new kiwi.Container()<CryptoCurrencyRateBloc>();

  @override
  void initState() {
    super.initState();
    _cryptoCurrencyBloc.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cryptocurrencies')),
      body: BlocBuilder(
        bloc: _cryptoCurrencyBloc,
        builder: ListViewBuilder<CryptoCurrencyRate>(
          onLoading: (context) => LinearProgressIndicator(),
          onResult: (context, cryptoCurrencies) => CryptoCurrencyList(
            cryptoCurrencies: cryptoCurrencies,
            onValueSelected: _navigateToCryptoCurrencyDetails,
            onRefresh: _cryptoCurrencyBloc.refreshItems,
          ),
        ).build,
      ),
    );
  }

  void _navigateToCryptoCurrencyDetails(CryptoCurrencyRate value) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => CryptoCurrencyDetailScreen(
          cryptoCurrencyRate: value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cryptoCurrencyBloc.dispose();
  }
}
