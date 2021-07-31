import 'package:flutter/material.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/playListsContainer.dart';

class ListBuilderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // OpenDb.getSongList();
    return Scaffold(
      appBar: AppBar(
        title: Text("app bar"),
      ),
      body: Container(
        color: Colors.transparent,
        child: OpenDb.currentSongList == null
            ? Text("no play")
            : ListView.builder(
                itemCount: OpenDb.currentSongList.length,
                itemBuilder: (BuildContext context, idx) {
                  print("builder----");
                  return Text("data");
                },
              ),
      ),
    );
  }
}
