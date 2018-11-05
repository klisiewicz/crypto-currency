import 'package:crypto_currency/crypto/crypto_currency_app.dart';
import 'package:crypto_currency/crypto/di/injector.dart';
import 'package:flutter/material.dart';

void main() {
//  debugPaintSizeEnabled = true;
  inject();
  runApp(new CryptoCurrencyApp());
}
