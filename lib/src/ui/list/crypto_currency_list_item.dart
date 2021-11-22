import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/ui/common/money_format.dart';
import 'package:crypto_currency/src/ui/common/trend_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCurrencyListItem extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;
  final VoidCallback? onTap;

  const CryptoCurrencyListItem({
    required this.cryptoCurrencyRate,
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
              _CryptoCurrencyImage(cryptoCurrencyRate),
              const SizedBox(width: 16.0),
              Expanded(child: _CryptoCurrencyName(cryptoCurrencyRate)),
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
  final CryptoCurrencyRate cryptoCurrencyRate;

  const _CryptoCurrencyImage(
    this.cryptoCurrencyRate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${cryptoCurrencyRate.cryptoCurrency.symbol.toLowerCase()}.svg',
      placeholderBuilder: (context) => const CircleAvatar(),
    );
  }
}

class _CryptoCurrencyName extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;

  const _CryptoCurrencyName(
    this.cryptoCurrencyRate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          cryptoCurrencyRate.cryptoCurrency.symbol,
          style: context.subhead,
        ),
        const SizedBox(height: 2),
        Text(
          cryptoCurrencyRate.cryptoCurrency.name,
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
