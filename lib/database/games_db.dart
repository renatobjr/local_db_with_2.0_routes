import 'package:local_db_with_routes_2_0/database/app_db.dart';
import 'package:local_db_with_routes_2_0/models/game.dart';
import 'package:sqflite/sqflite.dart';

Future<List<Game>> fetchAllGames() async {
  try {
    final db = await DBProvider.db.database;
    var maps = await db.query('games');

    List<Game> gamesList =
        maps.isNotEmpty ? maps.map((g) => Game.fromMap(g)).toList() : [];

    return gamesList;
  } catch (e) {
    return Future.error(e);
  }
}

Future<void> insertGame(Game g) async {
  try {
    final db = await DBProvider.db.database;
    await db.insert('games', g.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  } catch (e) {
    Future.error(e);
  }
}

Future<Game> getGameByID(int id) async {
  try {
    final db = await DBProvider.db.database;
    var res = await db.query(
      'games',
      where: 'idGame = ?',
      whereArgs: [id],
    );
    return Game.fromMap(res.first);
  } catch (e) {
    return Future.error(e);
  }
}

Future<void> updateGame(Game g) async {
  try {
    final db = await DBProvider.db.database;

    await db.update(
      'games',
      g.toMap(),
      where: 'idGame = ?',
      whereArgs: [g.idGame],
    );
  } catch (e) {
    Future.error(e);
  }
}
