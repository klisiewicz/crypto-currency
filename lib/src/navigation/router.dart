import 'package:crypto_currency/src/domain/entity/crypto_currency_rate.dart';
import 'package:crypto_currency/src/ui/detail/crypto_currency_detail_screen.dart';
import 'package:crypto_currency/src/ui/list/crypto_currency_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<void>(
          builder: (_) => const CryptoCurrencyListScreen(),
        );
      case Routes.details:
        return MaterialPageRoute<void>(
          builder: (_) => CryptoCurrencyDetailScreen(
            settings.arguments! as CryptoCurrencyRate,
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

@immutable
class RouteNotFoundError extends Error {
  final String? routeName;

  RouteNotFoundError(this.routeName);
}
