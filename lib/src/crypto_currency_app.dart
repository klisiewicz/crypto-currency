import 'package:crypto_currency/src/navigation/router.dart' as nav;
import 'package:flutter/material.dart';

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrencies',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        accentColor: Colors.redAccent,
      ),
      onGenerateRoute: nav.Router().generateRoute,
      initialRoute: nav.Routes.home,
    );
  }
}
