import 'package:flutter/material.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/utils/db.dart';
import 'package:provider/provider.dart';

class PlayerControler extends StatefulWidget {
  @override
  _PlayerControlerState createState() => _PlayerControlerState();
}

class _PlayerControlerState extends State<PlayerControler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                Provider.of<MusicStateModel>(context, listen: false).preSong();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 50,
              )),
          IconButton(
              onPressed: () {
                Provider.of<MusicStateModel>(context, listen: false).resume();
              },
              icon: Consumer<MusicStateModel>(
                  builder: (context, model, _) => Icon(
                        model.playing ? Icons.pause : Icons.play_arrow,
                        size: 50,
                      ))),
          IconButton(
              onPressed: () {
                Provider.of<MusicStateModel>(context, listen: false).nextSong();
              },
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 50,
              ))
        ],
      ),
    );
  }
}
