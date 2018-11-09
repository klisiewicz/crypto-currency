import 'package:crypto_currency/crypto/cache/cache_policy.dart';

class CacheTimePolicy implements CachePolicy {
  DateTime _creationDate;

  @override
  bool isValid() {
    if (_creationDate == null) {
      _creationDate = DateTime.now();
      return false;
    } else {
      final now = DateTime.now();
      final difference = _creationDate.difference(now);
      if (difference.inMinutes > 5) {
        _creationDate = now;
        return false;
      } else {
        return true;
      }
    }
  }
}
