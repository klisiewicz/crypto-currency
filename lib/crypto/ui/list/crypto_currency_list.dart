import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list_item.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyList extends StatelessWidget {
  final List<CryptoCurrencyRate> cryptoCurrencies;
  final ValueSetter<CryptoCurrencyRate> onValueSelected;

  const CryptoCurrencyList(
      {Key key, @required this.cryptoCurrencies, this.onValueSelected})
      : assert(cryptoCurrencies != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: cryptoCurrencies.length,
        itemBuilder: (BuildContext context, int index) =>
            CryptoCurrencyListItem(
              cryptoCurrencyRate: cryptoCurrencies[index],
              onTap: () {
                if (onValueSelected != null)
                  onValueSelected(cryptoCurrencies[index]);
              },
            ),
      );
}
