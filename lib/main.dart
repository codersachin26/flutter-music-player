import 'package:flutter/material.dart';
import 'package:music_player/pages/playListsScreen.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlayListScreen(),
    );
  }
}
