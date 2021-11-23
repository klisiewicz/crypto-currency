import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/navigation/router.dart';
import 'package:crypto_currency/src/provider/provider.dart';
import 'package:crypto_currency/src/ui/list/crypto_currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CryptoCurrencyListScreen extends ConsumerWidget {
  const CryptoCurrencyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCurrencyRates = ref.watch(cryptoCurrencyRates);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrencies'),
      ),
      body: asyncCurrencyRates.when(
        loading: () => const LinearProgressIndicator(),
        data: (rates) {
          return CryptoCurrencyList(
            rates,
            onValueSelected: (rate) {
              _navigateToCryptoCurrencyDetails(context, rate);
            },
          );
        },
        error: (error, stackTrace) {},
      ),
    );
  }

  Future<void> _navigateToCryptoCurrencyDetails(
    BuildContext context,
    CryptoCurrencyRate rate,
  ) {
    return Navigator.pushNamed(context, Routes.details, arguments: rate);
  }
}
