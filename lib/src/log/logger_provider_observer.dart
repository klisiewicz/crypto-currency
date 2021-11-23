import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerProviderObserver extends ProviderObserver {
  const LoggerProviderObserver();

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print(
      '''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue"
  "newValue": "$newValue"
}''',
    );
  }
}
