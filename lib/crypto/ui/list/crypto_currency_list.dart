import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class CryptoCurrencyList extends StatelessWidget {
  final List<CryptoCurrencyRate> cryptoCurrencies;
  final ValueSetter<CryptoCurrencyRate> onValueSelected;
  final RefreshListCallback onRefresh;

  const CryptoCurrencyList({
    Key key,
    @required this.cryptoCurrencies,
    this.onValueSelected,
    this.onRefresh,
  })
      : assert(cryptoCurrencies != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewRefresh(
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
