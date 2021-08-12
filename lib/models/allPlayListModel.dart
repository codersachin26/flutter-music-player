import 'package:music_player/models/playListModel.dart';
import 'package:music_player/utils/db.dart';

class AllPlayList {
  final List<Map<String, MyPlayList>> _allPlayList;

  AllPlayList(this._allPlayList);

  void addPlaylist(String listName) {
    this._allPlayList.add({listName: MyPlayList(listName, [])});
    createPlayList(listName);
  }

  MyPlayList getPlayList(String name) {
    final index =
        this._allPlayList.indexWhere((playList) => playList['name'] == name);
    MyPlayList playList = this._allPlayList[index][name];
    return playList;
  }

  void removePlayList(String name) {
    final index =
        this._allPlayList.indexWhere((playList) => playList['name'] == name);
    this._allPlayList.removeAt(index);
    removePlayList(name);
  }
}
