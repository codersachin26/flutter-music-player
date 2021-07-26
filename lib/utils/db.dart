import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Future<bool> databaseExists(String path) =>
//     databaseFactory.databaseExists(path);

// setup sqflite database
class OpenDb {
  static Database db;
  static List<Map<String, dynamic>> playlists;
  static void openDB() async {
    db = await getdb();
    playlists = await getPlayLists(db);
  }
}

// create database
Future<Database> getdb() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String dbpath = join(await getDatabasesPath(), "musicss_db.db");
  print("DB : $dbpath");
  final db = openDatabase(dbpath, onCreate: (db, virsion) {
    return db.execute(
      'CREATE TABLE playlist(name TEXT,tablename TEXT)',
    );
  }, version: 1);
  print("DB object : $db");
  return db;
}

// create new playlist table
void createPlayList(Database db, String playlistname) async {
  final tableName = playlistname.replaceAll(" ", "");
  print("table : $tableName");
  print("playlistname : $playlistname");
  Map<String, String> values = {'name': playlistname, 'tablename': tableName};
  await db.execute('CREATE TABLE $tableName(track TEXT, artist TEXT,url TEXT)');
  final id = await db.insert('playlist', values);
  print("ID : $id");
}

void just(Database db, String playlistname) {
  createPlayList(db, playlistname);
}

// insert track data into playlist
Future<void> insertTrack(
    Database db, String playlistname, SongInfo song) async {
  Map<String, String> values = {
    'track': song.title,
    'artist': song.artist,
    'url': song.uri,
  };
  await db.insert(playlistname, values,
      conflictAlgorithm: ConflictAlgorithm.replace);
}

// get all playlist tracks
Future<List<Map<String, String>>> getTracks(
    Database db, String playlistname) async {
  return await db.query(playlistname);
}

// remove track from playlist
Future<void> removeTrack(Database db, String playlistname, int trackId) async {
  await db.delete(playlistname, where: 'id = ?', whereArgs: [trackId]);
}

// remove music playlist from playlist table
void removePlayList(Database db, Map<String, dynamic> playlist) async {
  print("tablename : ${playlist['tablename']}");
  await db.rawQuery('DROP TABLE ${playlist['tablename']}');
  await db.rawDelete('DELETE FROM playlist WHERE name = ?', [playlist['name']]);
}

// get all play lists name
Future<List<Map<String, dynamic>>> getPlayLists(Database db) async {
  List<Map<String, dynamic>> playlist;
  playlist = await db.query("playlist");
  // print("playlist : $playlist");
  return playlist;
}

void updatePlayList() async {
  OpenDb.playlists = await getPlayLists(OpenDb.db);
}
