import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/widgets/musicArtContainer.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playerControler.dart';
import 'package:music_player/widgets/songInfoText.dart';
import 'package:music_player/widgets/songSlider.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music player"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[999],
      ),
      body: Container(
        decoration: myDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            MusicArtContainer(),
            SongInfoText(),
            SongSlider(),
            PlayerControler()
          ],
        ),
      ),
    );
  }
}
