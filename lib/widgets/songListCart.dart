// song list card
import 'package:flutter/material.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/pages/AllSongListScreen.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:provider/provider.dart';

class SongListCard extends StatelessWidget {
  final Map<String, dynamic> playlist;
  final IconData listIcon;
  final Color iconColor;

  const SongListCard({Key key, this.playlist, this.listIcon, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width * .27,
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              listIcon,
              size: 40,
              color: iconColor,
            ),
            Text(
              "${playlist['name']}",
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
      onTap: () {
        final MusicStateModel model =
            Provider.of<MusicStateModel>(context, listen: false);
        if (playlist['name'] == 'All Songs') {
          // Navigator.pushNamed(context, '/allSongs');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ListenableProvider<MusicStateModel>.value(
                        value: model,
                        child: AllSongScreen(),
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SongsListScreen(
                        playList: playlist,
                        playListIcon: listIcon,
                        iconColor: iconColor,
                      )));
        }
      },
    );
  }
}
