import 'package:bloc/bloc.dart';
import 'package:crypto_currency/src/crypto_currency_app.dart';
import 'package:crypto_currency/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  _ensureFlutterBindingsInitialized();
  _setPortraitMode();
  _injectDependencies();
  _setupBlocDelegate();
  runApp(CryptoCurrencyApp());
}

void _ensureFlutterBindingsInitialized() =>
    WidgetsFlutterBinding.ensureInitialized();

void _setPortraitMode() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _setupBlocDelegate() => BlocSupervisor.delegate = inject<BlocDelegate>();

void _injectDependencies() => Injector.inject();
