import 'package:flutter/material.dart';
import 'package:music_player/pages/playListsScreen.dart';
import 'package:music_player/widgets/themeData.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkBlueTheme(context),
      home: PlayListScreen(),
    );
  }
}
