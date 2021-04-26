import 'package:bloc_imc/views/home.dart';
import 'package:bloc_imc/views/screen_1.dart';
import 'package:bloc_imc/views/screen_2.dart';
import 'package:bloc_imc/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AppRoutes {

  static const String APP_ROUTE_HOME = "/home";
  static const String APP_ROUTE_SCREEN_1 = "/screen_1";
  static const String APP_ROUTE_SCREEN_2 = "/screen_2";
  static const String APP_ROUTE_ABOUT = "/about";

  Route getRoutes(RouteSettings routeSettings) {

    switch(routeSettings.name) {

      case APP_ROUTE_HOME: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => AndroidHome('NutriApp')
        );
      }

      case APP_ROUTE_SCREEN_1: {
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Screen1(),
        );
      }

      case APP_ROUTE_SCREEN_2: {
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Screen2(),
        );
      }

      case APP_ROUTE_ABOUT: {
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => About(),
        );
      }

      default: {
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => AndroidHome('NutriApp')
        );
      }

    }

  }

}