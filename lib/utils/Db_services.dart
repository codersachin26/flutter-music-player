import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class MusicDB {
  static Database dbConnection;

  // open database connection
  static void openDbConnection() async {
    WidgetsFlutterBinding.ensureInitialized();
    final String dbpath = join(await getDatabasesPath(), "music_lite.db");
    print("DB : $dbpath");
    final dbCon = await openDatabase(dbpath, onCreate: (db, virsion) {
      db.execute(
        'CREATE TABLE playlist(name TEXT)',
      );
      db.execute(
        'CREATE TABLE favorites(id TEXT)',
      );
    }, version: 1);

    MusicDB.dbConnection = dbCon;
  }

// create new playlist table in database
  void createPlayListInDB(String listName) async {
    Map<String, String> values = {
      'name': listName,
    };
    final String tableName = listName.replaceAll(" ", "");
    await MusicDB.dbConnection.execute('CREATE TABLE $tableName(id TEXT)');
    final id = await MusicDB.dbConnection.insert('playlist', values);
    print("ID : $id");
  }

// remove  playlist from DB
  void removePlayListFromDB(String name) async {
    final tableName = name.replaceAll(" ", "").toLowerCase();
    await MusicDB.dbConnection.rawQuery('DROP TABLE $tableName');
    await MusicDB.dbConnection
        .rawDelete('DELETE FROM playlist WHERE name = ?', [name]);
  }

// get all playlists from DB
  Future<List<Map<String, dynamic>>> getPlayListsFromDB() async {
    List<Map<String, dynamic>> playlist;
    playlist = await MusicDB.dbConnection.query("playlist");
    return playlist;
  }

// insert songs into playlist table
  void insertSongstoPlaylistDB(String name, List<String> songids) async {
    final tableName = name.replaceAll(" ", "").toLowerCase();
    Batch batch = MusicDB.dbConnection.batch();
    songids.forEach((id) {
      batch.insert(tableName, {
        'id': id,
      });
    });
    await batch.commit(noResult: true);
  }
}
