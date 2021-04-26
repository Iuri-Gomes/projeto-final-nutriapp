import 'package:bloc_imc/app/app.dart';
import 'package:bloc_imc/views/views.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NutriApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: AndroidHome("NutriApp"),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}
