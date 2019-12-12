import 'package:crypto_currency/src/crypto_currency_app.dart';
import 'package:crypto_currency/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Injector.inject();

  runApp(CryptoCurrencyApp());
}
