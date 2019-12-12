import 'package:clock/clock.dart';
import 'package:crypto_currency/src/data/cache/cache_policy.dart';

class CacheTimePolicy implements CachePolicy {
  final Clock clock;
  DateTime _creationDate;

  CacheTimePolicy(this.clock);

  @override
  bool isValid() {
    if (_creationDate == null) {
      _creationDate = clock.now();
      return false;
    } else {
      final now = clock.now();
      final difference = now.difference(_creationDate);
      if (difference.inMinutes >= 5) {
        _creationDate = now;
        return false;
      } else {
        return true;
      }
    }
  }
}
