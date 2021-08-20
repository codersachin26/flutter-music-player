import 'package:flutter/material.dart';
import 'package:music_player/models/allPlayListModel.dart';
import 'package:music_player/pages/AllSongListScreen.dart';

class PlayListNamebtn extends StatelessWidget {
  final String playlist;
  final AllPlayList model;

  const PlayListNamebtn({Key key, this.playlist, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(10),
        child: ListTile(
      leading: Icon(Icons.playlist_add),
      title: Text(playlist),
      onTap: () {
        final myPlayList = model.getPlayListByName(playlist);
        myPlayList.addsongs(model.getSlectedSongIds);
        allSongsState.setState(() {
          allSongsState.isEdit = !allSongsState.isEdit;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("your song added to $playlist list")));
        Navigator.pop(context);
        print("nothing");
      },
    ));
  }
}
