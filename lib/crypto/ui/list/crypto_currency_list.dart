import 'package:crypto_currency/crypto/domain/crypto_currency.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list_item.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyList extends StatelessWidget {
  final List<CryptoCurrency> cryptoCurrencies;

  const CryptoCurrencyList({Key key, @required this.cryptoCurrencies})
      : assert(cryptoCurrencies != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: cryptoCurrencies.length,
      itemBuilder: (BuildContext context, int index) => CryptoCurrencyListItem(
            cryptoCurrency: cryptoCurrencies[index],
          ));
}
