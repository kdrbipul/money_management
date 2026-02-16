import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class TaskDatabase {
  static Database ? _db;

  static Future<Database> getDb() async {
    if (_db != null) return _db!;
    _db = await openDatabase(
        p.join(await getDatabasesPath(), 'task.db'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, date TEXT, isDone INTEGER)"
          );
        },
        version: 1,
    );
    return _db!;
  }

  static Future<void> insert(String title, String date) async {
    final db = await getDb();
    await db.insert(
      'tasks',
      {
        'title': title,
        'date': date,
        'isDone': 0,
      },

      conflictAlgorithm: ConflictAlgorithm.replace,

    );
  }
}