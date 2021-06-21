import 'package:flutter/material.dart';
import 'package:local_db_with_routes_2_0/screens/form_games.dart';
import 'package:local_db_with_routes_2_0/screens/index.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pushNamed(context, Index.route),
          ),
          ListTile(
            leading: Icon(Icons.gamepad),
            title: Text('New Game'),
            onTap: () => Navigator.pushNamed(context, FormGames.route),
          )
        ],
      ),
    );
  }
}
