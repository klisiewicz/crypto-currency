import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/ui/list/crypto_currency_list_item.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyList extends StatelessWidget {
  final List<CryptoCurrencyRate> cryptoCurrencies;
  final ValueSetter<CryptoCurrencyRate>? onValueSelected;

  const CryptoCurrencyList(
    this.cryptoCurrencies, {
    Key? key,
    this.onValueSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptoCurrencies.length,
      itemBuilder: (BuildContext context, int index) {
        final cryptoCurrency = cryptoCurrencies[index];
        return CryptoCurrencyListItem(
          cryptoCurrency,
          onTap: () {
            onValueSelected?.call(cryptoCurrency);
          },
        );
      },
    );
  }
}
