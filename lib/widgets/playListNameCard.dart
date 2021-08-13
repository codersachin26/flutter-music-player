import 'package:flutter/material.dart';
import 'package:music_player/pages/AllSongListScreen.dart';
import 'package:music_player/utils/db.dart';

class PlayListNamebtn extends StatelessWidget {
  final Map<String, dynamic> playlist;

  const PlayListNamebtn({Key key, this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(10),
        child: ListTile(
      leading: Icon(Icons.playlist_add),
      title: Text(playlist['name']),
      onTap: () {
        final myPlayList =
            OpenDb.allPlayList.getPlayListByName(playlist['name']);
        myPlayList.addsongs(OpenDb.pickedSongIdx);
        allSongsState.setState(() {
          allSongsState.isEdit = !allSongsState.isEdit;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("your song added to ${playlist['name']} list")));
        Navigator.pop(context);
        print("nothing");
      },
    ));
  }
}
