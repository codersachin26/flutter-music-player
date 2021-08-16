import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/models/PlayerStateModel.dart';
import 'package:music_player/models/allPlayListModel.dart';
import 'package:music_player/models/playListModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// setup sqflite database
class OpenDb {
  static Database db;
  static List<int> pickedSongIdx = [];
  static List<SongInfo> allSongs;
  static List<Map<String, dynamic>> playlists;
  static AllPlayList allPlayList;
  static void openDB() async {
    db = await getdb();
    playlists = await getPlayListsFromDB();
    getAllSongs();
  }
}

// get all songs
void getAllSongs() async {
  final FlutterAudioQuery audioQuery = new FlutterAudioQuery();
  OpenDb.allSongs = await audioQuery.getSongs();
}

// create database
Future<Database> getdb() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String dbpath = join(await getDatabasesPath(), "musics_db.db");
  print("DB : $dbpath");
  final db = openDatabase(dbpath, onCreate: (db, virsion) {
    db.execute(
      'CREATE TABLE playlist(name TEXT)',
    );
    db.execute(
      'CREATE TABLE favorites(id TEXT)',
    );
  }, version: 1);

  return db;
}

// create new playlist table
void createPlayListInDB(String listName) async {
  Map<String, String> values = {
    'name': listName,
  };
  final String tableName = listName.replaceAll(" ", "");
  await OpenDb.db.execute('CREATE TABLE $tableName(id TEXT)');
  final id = await OpenDb.db.insert('playlist', values);
  print("ID : $id");
}

// remove  playlist from DB
void removePlayListFromDB(String name) async {
  final tableName = name.replaceAll(" ", "").toLowerCase();
  await OpenDb.db.rawQuery('DROP TABLE $tableName');
  await OpenDb.db.rawDelete('DELETE FROM playlist WHERE name = ?', [name]);
}

// get all playlists from DB
Future<List<Map<String, dynamic>>> getPlayListsFromDB() async {
  List<Map<String, dynamic>> playlist;
  playlist = await OpenDb.db.query("playlist");
  return playlist;
}

// insert songs into playlist table
void insertSongstoPlaylistDB(String name, List<String> songids) async {
  final tableName = name.replaceAll(" ", "").toLowerCase();
  Batch batch = OpenDb.db.batch();
  songids.forEach((id) {
    batch.insert(tableName, {
      'id': id,
    });
  });
  await batch.commit(noResult: true);
}

void selectSong(int idx) {
  if (OpenDb.pickedSongIdx.contains(idx)) {
    OpenDb.pickedSongIdx.remove(idx);
  } else {
    OpenDb.pickedSongIdx.add(idx);
  }
}

// AllPlayList getMyPlayLists() {
//   final playlists = OpenDb.playlists;
//   AllPlayList allPlayList = AllPlayList();
//   print("allPlayList======--> $allPlayList");
//   playlists.forEach((playlist) async {
//     print("inter in");
//     List<Map<String, dynamic>> queryData =
//         await OpenDb.db.query(playlist['name']);
//     List<String> ids = <String>[];
//     queryData.forEach((songId) {
//       ids.add(songId['id'].toString());
//     });
//     allPlayList.addPlaylist(playlist['name'], ids);
//   });
//   print(allPlayList);
//   return allPlayList;
// }
