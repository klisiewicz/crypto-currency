import 'package:crypto_currency/crypto/ui/list/crypto_currency_list_screen.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrencies',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        accentColor: Colors.redAccent,
      ),
      home: CryptoCurrencyListScreen(),
    );
  }
}
