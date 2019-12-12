import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/ui/list/crypto_currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class CryptoCurrencyList extends StatelessWidget {
  final List<CryptoCurrencyRate> cryptoCurrencies;
  final ValueSetter<CryptoCurrencyRate> onValueSelected;
  final VoidCallback onRefresh;

  const CryptoCurrencyList(this.cryptoCurrencies, {
    Key key,
    this.onValueSelected,
    this.onRefresh,
  })
      : assert(cryptoCurrencies != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshView(
      child: ListView.builder(
        itemCount: cryptoCurrencies.length,
        itemBuilder: (BuildContext context, int index) =>
            CryptoCurrencyListItem(
              cryptoCurrencyRate: cryptoCurrencies[index],
              onTap: () {
                onValueSelected?.call(cryptoCurrencies[index]);
              },
            ),
      ),
      onRefresh: onRefresh,
    );
  }
}
