import 'package:flutter/material.dart';
import 'package:local_db_with_routes_2_0/screens/splash_screen.dart';
import 'package:local_db_with_routes_2_0/utils/route_controller.dart';

void main() {
  runApp(GamesApp());
}

class GamesApp extends StatelessWidget {
  const GamesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.route,
      onGenerateRoute: RouteController.generateRoute,
    );
  }
}
