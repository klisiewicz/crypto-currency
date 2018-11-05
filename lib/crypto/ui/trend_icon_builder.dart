import 'package:crypto_currency/crypto/domain/crypto_currency_trend.dart';
import 'package:flutter/material.dart';

Widget buildTrendIcon(BuildContext context, Trend trend) {
  switch (trend) {
    case Trend.rising:
      return Icon(
        Icons.keyboard_arrow_up,
        color: Color(0xFF7FF2CC),
      );
    case Trend.falling:
      return Icon(
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
