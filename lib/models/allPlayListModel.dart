import 'package:music_player/models/playListModel.dart';
import 'package:music_player/utils/db.dart';

class AllPlayList {
  Map<String, MyPlayList> _allPlayList;

  AllPlayList(this._allPlayList);

  void addPlaylist(String listName, [List<String> ids]) {
    this._allPlayList[listName] = MyPlayList(listName, ids);
    createPlayListIntoDB(listName);
  }

  List<String> getAllPlayList() {
    return this._allPlayList.keys;
  }

  MyPlayList getPlayListByName(String name) {
    final playlist = this._allPlayList[name];
    return playlist;
  }

  void removePlayList(String name) {
    this._allPlayList.remove(name);
    removePlayListFromDB(name);
  }
}
