import 'package:flutter/material.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:music_player/pages/playListsScreen.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/themeData.dart';

void main() {
  OpenDb.openDB();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkBlueTheme(context),
      home: PlayListsScreen(),
      routes: {'/playlist': (context) => SongsListScreen()},
    );
  }
}
