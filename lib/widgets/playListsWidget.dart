import 'package:flutter/material.dart';

class PlayListsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .85,
      width: size.width,
      decoration: MyDecoration(),
      child: Column(
        children: <Widget>[
          Row(
            children: [AllSongList(), FavoriteSongList()],
          ),
          Row(
            children: [PlayListText(), AddPlayListButton()],
          ),
          PlayListName()
        ],
      ),
    );
  }
}
