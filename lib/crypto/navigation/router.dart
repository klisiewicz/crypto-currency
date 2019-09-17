import 'package:crypto_currency/crypto/domain/crypto_currency_rate.dart';
import 'package:crypto_currency/crypto/ui/detail/crypto_currency_detail_screen.dart';
import 'package:crypto_currency/crypto/ui/list/crypto_currency_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => CryptoCurrencyListScreen());
      case Routes.details:
        return MaterialPageRoute(
          builder: (_) => CryptoCurrencyDetailScreen(
            settings.arguments as CryptoCurrencyRate,
          ),
        );
      default:
        throw RouteNotFoundError(settings.name);
    }
  }
}

class Routes {
  static const String home = '/';
  static const String details = '/details';
}

class RouteNotFoundError extends Error {
  final String routeName;

  RouteNotFoundError(this.routeName);
}
