import 'package:flutter/material.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playListsContainer.dart';
import 'package:music_player/widgets/songListCart.dart';

class PlayListsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .80,
      width: size.width,
      decoration: myDecoration(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SongListCard(
                  playlist: {'name': "All Songs"},
                  listIcon: Icons.music_note,
                  iconColor: Colors.deepPurple,
                ),
                SongListCard(
                  listIcon: Icons.favorite,
                  playlist: {'name': "Favorites"},
                  iconColor: Colors.red,
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          PlayListContainer()
        ],
      ),
    );
  }
}
