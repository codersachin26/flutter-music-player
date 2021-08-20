import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/utils/Db_services.dart';

class MyPlayList {
  final String _name;
  final List<String> _ids;
  MusicDB musicDB = MusicDB();

  MyPlayList(this._name, this._ids);

  // get playlist name
  String get name => this._name;

  // get track counts
  int count() {
    return this._ids.length;
  }

// get all songs
  Future<List<SongInfo>> getSongs() async {
    FlutterAudioQuery audioQuery = FlutterAudioQuery();
    return await audioQuery.getSongsById(ids: this._ids);
  }

// add songs ids to playlist
  void addsongs(List<String> songIds) {
    this._ids.addAll(songIds);
    musicDB.insertSongstoPlaylistDB(this._name, songIds);
  }
}
