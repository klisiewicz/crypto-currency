import 'package:crypto_currency/src/domain/entity/money.dart';
import 'package:crypto_currency/src/ui/common/money_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MoneyFormat moneyFormat;

  setUp(() {
    moneyFormat = const MoneyFormat();
  });

  test(
      'should format money with two decimal places when value is grater than one',
      () {
    // When
    final formattedMoney = moneyFormat.format(
      const Money(amount: 1.0000, currency: 'USD'),
    );

    // Then
    expect(formattedMoney, '\$1.00');
  });

  test(
      'should format money with two decimal places when value is grater than one',
      () {
    // When
    final formattedMoney = moneyFormat.format(
      const Money(amount: 0.9999, currency: 'USD'),
    );

    // Then
    expect(formattedMoney, '\$0.9999');
  });
}
