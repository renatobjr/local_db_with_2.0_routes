import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_db_with_routes_2_0/database/games_db.dart';
import 'package:local_db_with_routes_2_0/models/game.dart';
import 'package:local_db_with_routes_2_0/screens/index.dart';
import 'package:local_db_with_routes_2_0/widgets/app_drawer.dart';

class FormGames extends StatefulWidget {
  FormGames({
    Key? key,
    this.idGame,
  }) : super(key: key);

  static const route = '/form_game';
  final dynamic idGame;

  @override
  _FormGamesState createState() => _FormGamesState();
}

class _FormGamesState extends State<FormGames> {
  Game _newGame = Game();
  final _formKey = GlobalKey<FormState>();
  // Controllers to pass data to form
  final titleController = TextEditingController();
  final plataformController = TextEditingController();

  void _saveGame() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_newGame.idGame == null) {
        await insertGame(
          Game(
            title: _newGame.title,
            plataform: _newGame.plataform,
          ),
        );
      } else {
        await updateGame(
          Game(
            idGame: widget.idGame,
            title: _newGame.title,
            plataform: _newGame.plataform,
          ),
        );
      }
      Navigator.popAndPushNamed(context, Index.route);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data Insert'),
        ),
      );
    }
  }

  @override
  void initState() {
    print(widget.idGame);
    if (widget.idGame != null) {
      getGameByID(widget.idGame).then((g) {
        setState(() {
          _newGame.idGame = widget.idGame as int;
          titleController.text = g.title as String;
          plataformController.text = g.plataform as String;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('New Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  onSaved: (value) => _newGame.title = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: plataformController,
                  decoration: InputDecoration(
                    labelText: 'Plataform',
                  ),
                  onSaved: (value) => _newGame.plataform = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () => _saveGame(),
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
