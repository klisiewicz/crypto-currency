import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCurrencyListItem extends StatelessWidget {
  final CryptoCurrencyRate cryptoCurrencyRate;
  final GestureTapCallback onTap;

  const CryptoCurrencyListItem(
      {Key key, @required this.cryptoCurrencyRate, this.onTap})
      : assert(cryptoCurrencyRate != null),
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: _buildContent(context),
            decoration: BoxDecoration(
                border:
                Border(bottom: BorderSide(color: dividerColor(context)))),
          ),
        ),
      );

  Widget _buildContent(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildPicture(),
        _buildHorizontalPadding(8.0),
        _buildName(context),
        _buildHorizontalPadding(8.0),
        _buildRate(context),
      ],
    );
  }

  Widget _buildPicture() =>
      CircleAvatar(
        child: SvgPicture.asset(
          'assets/icons/${cryptoCurrencyRate.cryptoCurrency.symbol
              .toLowerCase()}.svg',
          placeholderBuilder: (BuildContext context) => CircleAvatar(),
        ),
      );

  Widget _buildName(BuildContext context) =>
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(cryptoCurrencyRate.cryptoCurrency.symbol,
                style: subheadStyle(context)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
            ),
            Text(cryptoCurrencyRate.cryptoCurrency.name,
                style: captionStyle(context))
          ],
        ),
      );

  Widget _buildHorizontalPadding(double value) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
      );

  Widget _buildRate(BuildContext context) =>
      Row(
        children: <Widget>[
          Text('${cryptoCurrencyRate.price.toStringAsFixed(4)} USD'),
          _buildHorizontalPadding(8.0),
          _buildTrendIcon(context),
        ],
      );

  Widget _buildTrendIcon(BuildContext context) {
    switch (cryptoCurrencyRate.trendValue.trend) {
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
          color: dividerColor(context),
        );
    }
  }

  TextStyle captionStyle(BuildContext context) =>
      Theme
          .of(context)
          .textTheme
          .caption;

  TextStyle subheadStyle(BuildContext context) =>
      Theme
          .of(context)
          .textTheme
          .subhead;

  Color dividerColor(BuildContext context) => Theme.of(context).dividerColor;
}
