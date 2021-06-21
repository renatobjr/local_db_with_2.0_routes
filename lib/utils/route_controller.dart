import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_db_with_routes_2_0/screens/form_games.dart';
import 'package:local_db_with_routes_2_0/screens/index.dart';
import 'package:local_db_with_routes_2_0/screens/splash_screen.dart';

class RouteController {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/index':
        return MaterialPageRoute(builder: (context) => Index());
      case '/form_game':
        return MaterialPageRoute(
          builder: (context) => FormGames(
            idGame: args,
          ),
        );
      default:
        return _errorHandling();
    }
  }

  static Route<dynamic> _errorHandling() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
