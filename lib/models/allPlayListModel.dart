import 'package:flutter/cupertino.dart';
import 'package:music_player/models/playListModel.dart';
import 'package:music_player/utils/Db_services.dart';

class AllPlayList extends ChangeNotifier {
  Map<String, MyPlayList> _allPlayList = Map<String, MyPlayList>();
  MusicDB musicDB = MusicDB();

  void addPlaylist(String listName, [List<String> ids]) {
    this._allPlayList[listName] = MyPlayList(listName, ids);
    musicDB.createPlayListInDB(listName);
    notifyListeners();
  }

  List<String> getAllPlayList() {
    print("this._allPlayList.keys-----> ${this._allPlayList}");
    final playlist = this._allPlayList.keys.toList();

    if (this._allPlayList.isNotEmpty) {
      return playlist;
    }
    return [];
  }

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
    final playLists = await musicDB.getPlayListsFromDB();
    List<String> playListName;
    playLists.forEach((playList) {
      playListName.add(playList['name']);
    });
    return playListName;
  }
}
