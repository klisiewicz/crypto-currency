import 'package:crypto_currency/crypto/cache/cache_policy.dart';
import 'package:crypto_currency/crypto/cache/cache_time_policy.dart';
import 'package:crypto_currency/crypto/time/date_time_provider.dart';
import 'package:test/test.dart';

class _DateTimeProviderMock implements DateTimeProvider {
  List<DateTime> dates = [];
  int _index = 0;

  @override
  DateTime get() => dates[_index++];
}

void main() {
  _DateTimeProviderMock dateTimeProvider;
  CachePolicy cachePolicy;
  DateTime now = DateTime.now();

  setUp(() {
    dateTimeProvider = _DateTimeProviderMock();
    cachePolicy = CacheTimePolicy(dateTimeProvider);
  });

  test("should be invalid when first called", () {
    // Given:
    dateTimeProvider.dates = [now];

    // When:
    var isValid = cachePolicy.isValid();

    // Then:
    expect(isValid, false);
  });

  test("should be invalid when enough time has passed", () {
    // Given
    dateTimeProvider.dates = [now, now.add(Duration(minutes: 5, seconds: 0))];
    cachePolicy.isValid();

    // When:
    var isValid = cachePolicy.isValid();

    // Then:
    expect(isValid, false);
  });

  test("should be valid when not enough time has passed", () {
    // Given
    dateTimeProvider.dates = [now, now.add(Duration(minutes: 4, seconds: 59))];
    cachePolicy.isValid();

    // When:
    var isValid = cachePolicy.isValid();

    // Then:
    expect(isValid, true);
  });
}
