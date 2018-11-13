import 'package:crypto_currency/crypto/time/date_time_provider.dart';

class DateTimeNowProvider implements DateTimeProvider {
  @override
  DateTime get() => DateTime.now();
}
