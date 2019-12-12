import 'package:crypto_currency/src/domain/entity/crypto_currency_trend.dart';
import 'package:flutter/material.dart';

class TrendIcon extends StatelessWidget {
  final Trend trend;

  const TrendIcon(this.trend, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (trend) {
      case Trend.rising:
        return const Icon(
          Icons.keyboard_arrow_up,
          color: Color(0xFF7FF2CC),
        );
      case Trend.falling:
        return const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xFFD36C68),
        );
      default:
        return Icon(
          Icons.remove,
          color: Theme.of(context).dividerColor,
        );
    }
  }
}

