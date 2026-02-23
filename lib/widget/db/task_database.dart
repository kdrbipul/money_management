import 'package:money_management/widget/db/task.dart';
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

  static Future<void> insert(Task task) async {
    final db = await getDb();
    await db.insert('tasks', task.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  static Future<List <Task>> getTasks() async {
    final db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }
}