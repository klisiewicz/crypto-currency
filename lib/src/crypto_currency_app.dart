import 'package:crypto_currency/src/navigation/router.dart' as nav;
import 'package:flutter/material.dart';

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrencies',
      theme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: const Color(0xFF1B1821),
        colorScheme: const ColorScheme.dark(
          surface: Colors.black87,
        ),
      ),
      onGenerateRoute: nav.Router().generateRoute,
      initialRoute: nav.Routes.home,
    );
  }
}
