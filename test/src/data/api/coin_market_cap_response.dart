import 'dart:convert';

import 'package:http/http.dart';

final cryptoCurrencies200Response = Response(
  json.encode(
    {
      'data': {
        '1': {
          'id': 1,
          'name': 'Bitcoin',
          'symbol': 'BTC',
          'rank': 1,
          'circulating_supply': 17008162.0,
          'total_supply': 17008162.0,
          'max_supply': 21000000.0,
          'quotes': {
            'USD': {
              'price': 9024.09,
              'volume_24h': 8765400000.0,
              'market_cap': 153483184623.0,
              'percent_change_1h': -2.31,
              'percent_change_24h': -4.18,
              'percent_change_7d': -0.47
            }
          }
        },
        '1027': {
          'id': 1027,
          'name': 'Ethereum',
          'symbol': 'ETH',
          'website_slug': 'ethereum',
          'rank': 2,
          'circulating_supply': 99151888.0,
          'total_supply': 99151888.0,
          'max_supply': null,
          'quotes': {
            'USD': {
              'price': 642.399,
              'volume_24h': 2871290000.0,
              'market_cap': 63695073558.0,
              'percent_change_1h': -3.75,
              'percent_change_24h': -7.01,
              'percent_change_7d': -2.32
            }
          },
        }
      },
    },
  ),
  200,
);
