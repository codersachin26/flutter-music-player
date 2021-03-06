import 'package:flutter/material.dart';
import 'package:music_player/pages/AllSongListScreen.dart';
import 'package:music_player/pages/PlayerScreen.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:music_player/pages/playListsScreen.dart';
import 'package:music_player/widgets/themeData.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkBlueTheme(context),
      home: PlayListsScreen(),
      routes: {
        '/playlist': (context) => SongsListScreen(),
        '/player': (context) => MusicPlayer(),
        '/allSongs': (context) => AllSongScreen()
      },
    );
  }
}
