import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _appDb;

  Future<Database> get database async {
    if (_appDb != null) return _appDb as Database;
    _appDb = await initDb();
    return _appDb as Database;
  }

  initDb() async {
    Directory docsDirectory = await getApplicationSupportDirectory();
    String appPath = join(docsDirectory.path, 'app_db');
    return await openDatabase(appPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE games"
          "(idGame INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title TEXT,"
          "plataform TEXT)");
    });
  }
}
