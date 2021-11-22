import 'package:crypto_currency/src/di/injector.dart';
import 'package:crypto_currency/src/domain/bloc/crypto_currency_rate_bloc.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/navigation/router.dart';
import 'package:crypto_currency/src/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/view.dart';

class CryptoCurrencyListScreen extends StatefulWidget {
  const CryptoCurrencyListScreen({Key? key}) : super(key: key);

  @override
  _CryptoCurrencyListScreenState createState() =>
      _CryptoCurrencyListScreenState();
}

class _CryptoCurrencyListScreenState extends State<CryptoCurrencyListScreen> {
  late CryptoCurrencyRateBloc _cryptoCurrencyBloc;

  @override
  void initState() {
    super.initState();
    _cryptoCurrencyBloc = inject<CryptoCurrencyRateBloc>()
      ..loadElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrencies'),
      ),
      body: ViewStateBuilder<List<CryptoCurrencyRate>, CryptoCurrencyRateBloc>(
        bloc: _cryptoCurrencyBloc,
        onLoading: (context) => const LinearProgressIndicator(),
        onSuccess: (context, cryptoCurrencies) =>
            CryptoCurrencyList(
              cryptoCurrencies,
              onValueSelected: _navigateToCryptoCurrencyDetails,
              onRefresh: _cryptoCurrencyBloc.refreshElements,
            ),
        onRefreshing: (context, cryptoCurrencies) =>
            CryptoCurrencyList(cryptoCurrencies),
      ),
    );
  }

  Future<void> _navigateToCryptoCurrencyDetails(CryptoCurrencyRate value) {
    return Navigator.pushNamed(context, Routes.details, arguments: value);
  }

  @override
  void dispose() {
    _cryptoCurrencyBloc.close();
    super.dispose();
  }
}
