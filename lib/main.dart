import 'package:crypto_currency/crypto/crypto_currency_app.dart';
import 'package:crypto_currency/crypto/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Injector.inject();

  runApp(CryptoCurrencyApp());
}
