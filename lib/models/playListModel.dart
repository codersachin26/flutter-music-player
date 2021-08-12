import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/utils/db.dart';

class MyPlayList {
  final String _name;
  final List<String> _ids;

  MyPlayList(this._name, this._ids);

  // get playlist name
  String get name => this._name;

  Future<List<SongInfo>> getSongs() async {
    FlutterAudioQuery audioQuery = FlutterAudioQuery();
    return await audioQuery.getSongsById(ids: this._ids);
  }

  void addsongs(List<String> ids) {
    List<String> songIds;
    ids.forEach((id) {
      songIds.add(id);
    });
    this._ids.addAll(songIds);
    insertSongstoPlaylist(this._name, songIds);
  }

  void removeSong(String id) {
    this._ids.remove(id);
    removeTrack(this._name, id);
  }
}
