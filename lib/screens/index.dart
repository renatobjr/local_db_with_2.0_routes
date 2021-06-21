import 'package:flutter/material.dart';
import 'package:local_db_with_routes_2_0/database/games_db.dart';
import 'package:local_db_with_routes_2_0/models/game.dart';
import 'package:local_db_with_routes_2_0/screens/form_games.dart';
import 'package:local_db_with_routes_2_0/widgets/app_drawer.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  static const route = '/index';

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('My Games'),
      ),
      body: FutureBuilder<List<Game>>(
        future: fetchAllGames(),
        builder: (BuildContext context, AsyncSnapshot<List<Game>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(10.00),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      height: 70.0,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pushNamed(
                                context, FormGames.route,
                                arguments: snapshot.data![i].idGame),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          Text(snapshot.data![i].title as String)
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: const Text('No game stored'),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
