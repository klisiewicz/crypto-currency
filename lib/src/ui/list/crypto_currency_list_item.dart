import 'package:crypto_currency/src/domain/entity/crypto_currency.dart';
import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/ui/common/money_format.dart';
import 'package:crypto_currency/src/ui/common/trend_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCurrencyListItem extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;
  final VoidCallback? onTap;

  const CryptoCurrencyListItem(
    this.cryptoCurrencyRate, {
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.dividerColor),
            ),
          ),
          child: Row(
            children: <Widget>[
              _CryptoCurrencyImage(cryptoCurrencyRate.cryptoCurrency),
              const SizedBox(width: 16.0),
              Expanded(
                child: _CryptoCurrencyName(cryptoCurrencyRate.cryptoCurrency),
              ),
              const SizedBox(width: 16.0),
              _CryptoCurrencyRate(cryptoCurrencyRate),
            ],
          ),
        ),
      ),
    );
  }
}

class _CryptoCurrencyImage extends StatelessWidget {
  final CryptoCurrency cryptoCurrency;

  const _CryptoCurrencyImage(
    this.cryptoCurrency, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 32,
      child: SvgPicture.asset(
        'assets/icons/${cryptoCurrency.symbol.toLowerCase()}.svg',
        placeholderBuilder: (context) => const CircleAvatar(),
      ),
    );
  }
}

class _CryptoCurrencyName extends StatelessWidget {
  final CryptoCurrency cryptoCurrency;

  const _CryptoCurrencyName(
    this.cryptoCurrency, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          cryptoCurrency.symbol,
          style: context.subhead,
        ),
        const SizedBox(height: 2),
        Text(
          cryptoCurrency.name,
          style: context.caption,
        )
      ],
    );
  }
}

class _CryptoCurrencyRate extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;

  const _CryptoCurrencyRate(
    this.cryptoCurrencyRate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const moneyFormat = MoneyFormat();
    return Row(
      children: <Widget>[
        Text(moneyFormat.format(cryptoCurrencyRate.price)),
        const SizedBox(width: 16.0),
        TrendIcon(cryptoCurrencyRate.trendHistory.hour.trend),
      ],
    );
  }
}

extension _ContextExt on BuildContext {
  Color get dividerColor => Theme.of(this).dividerColor;

  TextStyle? get subhead => Theme.of(this).textTheme.caption;

  TextStyle? get caption => Theme.of(this).textTheme.caption;
}
