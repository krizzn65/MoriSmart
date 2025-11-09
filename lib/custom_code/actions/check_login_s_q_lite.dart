// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<bool> checkLoginSQLite(String nomorhp, String password) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'moris.db');

  final db =
      await openDatabase(path, version: 1, onCreate: (db, version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, nomorhp TEXT, password TEXT)',
    );
  });

  final List<Map<String, dynamic>> result = await db.query(
    'users',
    where: 'nomorhp = ? AND password = ?',
    whereArgs: [nomorhp, password],
  );

  return result.isNotEmpty; // true jika ditemukan user
}
