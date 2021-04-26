import 'package:bloc_imc/app/app_routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  static final App _instance = App._internal();

  App._internal();

  factory App() => _instance;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getAppRoutes().getRoutes,
    );
  }

  AppRoutes getAppRoutes() => AppRoutes();

}
