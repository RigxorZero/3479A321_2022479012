import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/auditoria.dart';

class DatabaseHelper {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'auditoria.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE auditoria(id INTEGER PRIMARY KEY, accion TEXT)',
        );
      },
      version: 1,
    );
  }

  // Insertar una acción
  static Future<void> insertarAccion(Auditoria auditoria) async {
    final db = await getDatabase();
    await db.insert(
      'auditoria',
      auditoria.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Obtener todas las acciones
  static Future<List<Auditoria>> obtenerAcciones() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('auditoria');
    return List.generate(maps.length, (i) {
      return Auditoria(
        id: maps[i]['id'],
        accion: maps[i]['accion'],
      );
    });
  }
}
