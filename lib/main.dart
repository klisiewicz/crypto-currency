import 'package:crypto_currency/src/crypto_currency_app.dart';
import 'package:crypto_currency/src/log/logger_provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  _ensureFlutterBindingsInitialized();
  await _setPortraitMode();
  runApp(
    const ProviderScope(
      observers: [
        LoggerProviderObserver()
      ],
      child: CryptoCurrencyApp(),
    ),
  );
}

void _ensureFlutterBindingsInitialized() =>
    WidgetsFlutterBinding.ensureInitialized();

Future<void> _setPortraitMode() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
