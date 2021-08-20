import 'package:flutter/material.dart';
import 'package:music_player/models/allPlayListModel.dart';
import 'package:music_player/widgets/playListNameCard.dart';

newPlaylistDialogBox(BuildContext context, AllPlayList model) {
  String playlistname;
  // AllPlayList getAllPlayListModel() {
  //   return Provider.of<AllPlayList>(context, listen: false);
  // }

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
                      // final model = getAllPlayListModel();
                      print("model>>>>>>>>>>>>>>$model");
                      model.addPlaylist(playlistname);
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

removePlayListDialog(BuildContext context, String playlist, AllPlayList model) {
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
                      model.removePlayList(playlist);
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

addToPlayListDialog(BuildContext context, AllPlayList model) {
  final playListName = model.allPlayListName;
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(
            "Add to Playlist",
            style: TextStyle(fontSize: 15),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: playListName.length,
                itemBuilder: (context, idx) =>
                    PlayListNamebtn(playlist: playListName[idx], model: model)),
          )
        ],
      ),
    ),
  );
}
