import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/models/playListModel.dart';
import 'package:music_player/utils/Db_services.dart';

class AllPlayList extends ChangeNotifier {
  Map<String, MyPlayList> _allPlayList = Map<String, MyPlayList>();
  List<String> _allPlayListName = [];
  List<SongInfo> _allSongs = [];
  MusicDB musicDB = MusicDB();
  List<String> _selectedIds = [];

  void addPlaylist(String listName, [List<String> ids]) {
    this._allPlayList[listName] = MyPlayList(listName, ids);
    this._allPlayListName.add(listName);
    musicDB.createPlayListInDB(listName);
    notifyListeners();
  }

  // return all songs
  List<SongInfo> get getAllSong => this._allSongs;

  // return selected song ids
  List<String> get getSlectedSongIds => this._selectedIds;

  // set selected song ids
  void initSelectedSongIds() {
    this._selectedIds = [];
  }

  // return selected song ids
  List<String> get allPlayListName => this._allPlayListName;

  MyPlayList getPlayListByName(String name) {
    final playlist = this._allPlayList[name];
    return playlist;
  }

  void removePlayList(String name) {
    this._allPlayList.remove(name);
    musicDB.removePlayListFromDB(name);
    notifyListeners();
  }

  Future<List<String>> getAllPlayListName() async {
    if (this._allPlayListName.isEmpty) {
      return MusicDB.openDbConnection().then((value) async {
        final playLists = await musicDB.getPlayListsNameFromDB();
        playLists.forEach((playList) {
          this._allPlayListName.add(playList['name']);
        });
        initPlayLists();
        initAllSongs();
        return this._allPlayListName;
      });
    } else
      return this._allPlayListName;
  }

// set all playlists in allPlayList object
  void initPlayLists() {
    this._allPlayListName.forEach((playlistname) async {
      final queryData = await musicDB.getPlayListFromDB(playlistname);
      List<String> ids = [];
      queryData.forEach((id) {
        ids.add(id['id']);
      });
      this._allPlayList[playlistname] = MyPlayList(playlistname, ids);
    });
  }

  // get all songs
  void initAllSongs() async {
    final FlutterAudioQuery audioQuery = new FlutterAudioQuery();
    this._allSongs = await audioQuery.getSongs();
  }

  void addSelectedId(String id) {
    this._selectedIds.add(id);
  }
}
