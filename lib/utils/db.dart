import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// setup sqflite database
class OpenDb {
  static Database db;
  static List<int> pickedSong = [];
  static List<SongInfo> allSongs;
  static List<Map<String, dynamic>> currentSongList;
  static List<Map<String, dynamic>> playlists;
  static void openDB() async {
    db = await getdb();
    playlists = await getPlayLists(db);
    OpenDb.currentSongList = await getTracks(OpenDb.db, "Favorites");
  }
}

// create database
Future<Database> getdb() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String dbpath = join(await getDatabasesPath(), "musics_db.db");
  print("DB : $dbpath");
  final db = openDatabase(dbpath, onCreate: (db, virsion) {
    db.execute(
      'CREATE TABLE playlist(name TEXT,tablename TEXT)',
    );
    db.execute(
      'CREATE TABLE favorites(track TEXT, artist TEXT,url TEXT)',
    );
    db.insert("playlist", {'name': 'favorites', 'tablename': 'favorites'});
  }, version: 1);

  return db;
}

// create new playlist table
void createPlayList(Database db, String playlistname) async {
  final tableName = playlistname.replaceAll(" ", "").toLowerCase();
  Map<String, String> values = {'name': playlistname, 'tablename': tableName};
  print("Map----> $values");
  await db.execute('CREATE TABLE $tableName(track TEXT, artist TEXT,url TEXT)');
  final id = await db.insert('playlist', values);
  print("ID : $id");
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
Future<List<Map<String, dynamic>>> getTracks(
    Database db, String tablename) async {
  print("getTracks : $tablename");
  List<Map<String, dynamic>> songs = await db.query(tablename);
  // print("await : $songs");
  return songs;
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

void insertSongstoPlaylist(String tableName) async {
  Batch batch = OpenDb.db.batch();
  List<int> songs = OpenDb.pickedSong;
  songs.forEach((idx) {
    batch.insert(tableName, {
      'track': OpenDb.allSongs[idx].title.toString(),
      'artist': OpenDb.allSongs[idx].artist.toString(),
      'url': OpenDb.allSongs[idx].uri.toString()
    });
  });
  await batch.commit(noResult: true);
}

void selectSong(int idx) {
  if (OpenDb.pickedSong.contains(idx)) {
    OpenDb.pickedSong.remove(idx);
  } else {
    OpenDb.pickedSong.add(idx);
  }
}
