import 'dart:convert';
import 'package:http/http.dart';

final validResponse = Response(
  json.encode(
    {
      "data": [
        {
          "id": 1,
          "name": "Bitcoin",
          "symbol": "BTC",
        },
        {
          "id": 2,
          "name": "Litecoin",
          "symbol": "LTC",
        }
      ],
    },
  ),
  200,
);
