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
  // static List<dynamic> currentSongList;
  static List<Map<String, dynamic>> playlists;
  // static MusicPlayer musicPlayer;
  static AllPlayList allPlayList;
  static void openDB() async {
    db = await getdb();
    // OpenDb.musicPlayer = MusicPlayer();
    playlists = await getPlayLists(db);
    // OpenDb.currentSongList = await getTracks(OpenDb.db, "Favorites");
    getAllSongs();
    OpenDb.allPlayList = getMyPlayLists();
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
void createPlayListIntoDB(String listName) async {
  Map<String, String> values = {
    'name': listName,
  };
  final String tableName = listName.replaceAll(" ", "");
  await OpenDb.db.execute('CREATE TABLE $tableName(id TEXT)');
  final id = await OpenDb.db.insert('playlist', values);
  print("ID : $id");
}

// get all playlist tracks
// Future<List<dynamic>> getTracks(Database db, String tablename) async {
//   final FlutterAudioQuery audioQuery = new FlutterAudioQuery();
//   print("getTracks : $tablename");
//   List<Map<String, dynamic>> queryData = await db.query(tablename);
//   List<String> ids = <String>[];
//   queryData.forEach((songId) {
//     ids.add(songId['id'].toString());
//   });
//   print("Ids---> $ids");
//   var songs = await audioQuery.getSongsById(ids: ids);

//   return songs;
// }

// remove track from playlist
Future<void> removeTrack(String playListName, String songId) async {
  final tableName = playListName.replaceAll(" ", "").toLowerCase();
  await OpenDb.db.delete(tableName, where: 'id = ?', whereArgs: [songId]);
}

// remove music playlist from playlist table
void removePlayListFromDB(String name) async {
  final tableName = name.replaceAll(" ", "").toLowerCase();
  await OpenDb.db.rawQuery('DROP TABLE $tableName');
  await OpenDb.db.rawDelete('DELETE FROM playlist WHERE name = ?', [name]);
}

// get all play lists name
Future<List<Map<String, dynamic>>> getPlayLists(Database db) async {
  List<Map<String, dynamic>> playlist;
  playlist = await db.query("playlist");
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

AllPlayList getMyPlayLists() {
  final playlists = OpenDb.playlists;
  AllPlayList allPlayList;
  playlists.forEach((playlist) async {
    List<Map<String, dynamic>> queryData =
        await OpenDb.db.query(playlist['tablename']);
    List<String> ids = <String>[];
    queryData.forEach((songId) {
      ids.add(songId['id'].toString());
    });
    allPlayList.addPlaylist(playlist['name'], ids);
  });
  return allPlayList;
}
