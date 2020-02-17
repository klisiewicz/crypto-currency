import 'package:crypto_currency/src/domain/entity/money.dart';
import 'package:crypto_currency/src/ui/common/money_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MoneyFormat moneyFormat;

  setUp(() {
    moneyFormat = MoneyFormat();
  });

  test("should return empty string when no money is given", () {
    // When
    final formattedMoney = moneyFormat.format(null);

    // Then
    expect(formattedMoney, "");
  });

  test(
      "should format money with two decimal places when value is grater than one",
      () {
    // When
    final formattedMoney =
        moneyFormat.format(const Money(amount: 1.0000, currency: "USD"));

    // Then
    expect(formattedMoney, "\$1.00");
  });

  test(
      "should format money with two decimal places when value is grater than one",
      () {
    // When
    final formattedMoney =
        moneyFormat.format(const Money(amount: 0.9999, currency: "USD"));

    // Then
    expect(formattedMoney, "\$0.9999");
  });
}
