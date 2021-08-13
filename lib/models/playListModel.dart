import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/utils/db.dart';

class MyPlayList {
  final String _name;
  final List<String> _ids;

  MyPlayList(this._name, this._ids);

  // get playlist name
  String get name => this._name;

  // get track counts
  int count() {
    return this._ids.length;
  }

  Future<List<SongInfo>> getSongs() async {
    FlutterAudioQuery audioQuery = FlutterAudioQuery();
    return await audioQuery.getSongsById(ids: this._ids);
  }

  void addsongs(List<int> index) {
    List<String> songIds;
    index.forEach((i) {
      songIds.add(OpenDb.allSongs[i].id);
    });
    this._ids.addAll(songIds);
    insertSongstoPlaylistDB(this._name, songIds);
  }

  void removeSong(String id) {
    this._ids.remove(id);
    removeTrack(this._name, id);
  }
}
