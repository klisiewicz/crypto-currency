import 'package:crypto_currency/src/domain/entity/money.dart';
import 'package:intl/intl.dart';

class MoneyFormat {
  final String locale;

  MoneyFormat([this.locale]);

  String format(Money money) {
    if (money == null) return '';

    final decimalPlaces = (money.amount >= 1) ? 2 : 4;
    return NumberFormat.simpleCurrency(
      locale: locale,
      name: money.currency,
      decimalDigits: decimalPlaces,
    ).format(money.amount);
  }
}
