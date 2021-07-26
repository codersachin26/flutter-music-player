import 'package:flutter/material.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/playListsContainer.dart';

newPlaylistDialogBox(BuildContext context) {
  String playlistname;
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      height: 180.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: myInputDecoration(),
              onChanged: (value) {
                playlistname = value;
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    )),
                TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      createPlayList(OpenDb.db, playlistname);
                      // updatePlayList();
                      print("object 1 : ${OpenDb.playlists}");
                      Map<String, dynamic> newPlayList = {'name': playlistname};
                      List<Map<String, dynamic>> newplaylists =
                          List.from(OpenDb.playlists);
                      newplaylists.add(newPlayList);
                      print("newplaylists : $newplaylists");
                      OpenDb.playlists = newplaylists;
                      print("OpenDb.playlists : ${OpenDb.playlists}");
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

myInputDecoration() {
  return InputDecoration(
    hintText: "new playlist",
  );
}

removePlayListDialog(BuildContext context, Map<String, dynamic> playlist) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      height: 150.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(11.0),
            child: Text("Remove Playlist"),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.purple, fontSize: 18.0),
                    )),
                TextButton(
                    onPressed: () {
                      List<Map<String, dynamic>> newplaylists =
                          List.from(OpenDb.playlists);
                      print("object2 : $newplaylists");
                      // newplaylists.remove(playlist);
                      newplaylists.removeWhere(
                          (item) => item['name'] == playlist['name']);
                      print("object3 : $newplaylists");
                      OpenDb.playlists = newplaylists;
                      removePlayList(OpenDb.db, playlist);
                      playListContainerState.setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'remove',
                      style: TextStyle(color: Colors.purple, fontSize: 18.0),
                    )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
