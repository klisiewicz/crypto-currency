import 'package:crypto_currency/crypto/ui/home/crypto_currency_home.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cryptocurrencies',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        accentColor: Colors.redAccent,
      ),
      home: CryptoCurrencyHome(),
    );
  }
}
