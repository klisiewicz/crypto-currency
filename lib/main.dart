import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Cryptocurrencies',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text('Cryptocurrencies'),
          ),
          body: Center(child: Text('Cryptocurrencies')),
        ));
  }
}
