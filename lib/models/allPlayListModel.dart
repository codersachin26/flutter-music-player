import 'package:flutter/cupertino.dart';
import 'package:music_player/models/playListModel.dart';
import 'package:music_player/utils/Db_services.dart';

class AllPlayList extends ChangeNotifier {
  Map<String, MyPlayList> _allPlayList = Map<String, MyPlayList>();
  List<String> _allPlayListName = [];
  MusicDB musicDB = MusicDB();

  void addPlaylist(String listName, [List<String> ids]) {
    this._allPlayList[listName] = MyPlayList(listName, ids);
    this._allPlayListName.add(listName);
    musicDB.createPlayListInDB(listName);
    notifyListeners();
  }

  List<String> getAllPlayList() {
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
    if (this._allPlayListName.isEmpty) {
      return MusicDB.openDbConnection().then((value) async {
        final playLists = await musicDB.getPlayListsFromDB();
        print(playLists);
        playLists.forEach((playList) {
          this._allPlayListName.add(playList['name']);
        });
        return this._allPlayListName;
        // notifyListeners();
      });
      // return this._allPlayListName;
    } else
      return this._allPlayListName;
  }
}
