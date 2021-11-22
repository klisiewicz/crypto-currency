import 'package:clock/clock.dart';
import 'package:crypto_currency/src/data/cache/cache_policy.dart';
import 'package:crypto_currency/src/data/cache/cache_time_policy.dart';
import 'package:flutter_test/flutter_test.dart';

class _ClockMock extends Clock {
  List<DateTime> dates = [];
  int _index = 0;

  @override
  DateTime now() => dates[_index++];
}

void main() {
  late _ClockMock clock;
  late CachePolicy cachePolicy;

  setUp(() {
    clock = _ClockMock();
    cachePolicy = CacheTimePolicy(clock);
  });

  test('should be invalid when first called', () {
    // Given:
    clock.dates = [DateTime.now()];

    // When:
    final isValid = cachePolicy.isValid();

    // Then:
    expect(isValid, false);
  });

  test('should be invalid when enough time has passed', () {
    // Given
    final now = DateTime.now();
    clock.dates = [
      now,
      now.add(const Duration(minutes: 5)),
    ];

    cachePolicy.isValid();

    // When:
    final isValid = cachePolicy.isValid();

    // Then:
    expect(isValid, false);
  });

  test('should be valid when not enough time has passed', () {
    final now = DateTime.now();
    clock.dates = [now, now.add(const Duration(minutes: 4, seconds: 59))];

    // Given
    cachePolicy.isValid();

    // When:
    final isValid = cachePolicy.isValid();

    // Then:
    expect(isValid, true);
  });
}
