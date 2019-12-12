import 'package:crypto_currency/src/navigation/router.dart';
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
      onGenerateRoute: Router().generateRoute,
      initialRoute: Routes.home,
    );
  }
}
