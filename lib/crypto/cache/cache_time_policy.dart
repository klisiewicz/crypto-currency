import 'package:crypto_currency/crypto/cache/cache_policy.dart';
import 'package:crypto_currency/crypto/time/date_time_provider.dart';

class CacheTimePolicy implements CachePolicy {
  final DateTimeProvider dateTimeProvider;
  DateTime _creationDate;

  CacheTimePolicy(this.dateTimeProvider);

  @override
  bool isValid() {
    if (_creationDate == null) {
      _creationDate = dateTimeProvider.get();
      return false;
    } else {
      final now = dateTimeProvider.get();
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
