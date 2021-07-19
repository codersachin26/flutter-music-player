import 'package:flutter/material.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/playListsWidget.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key key}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Lists"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[PlayListsWidget(), BottomPlayerWidget()],
        ),
      ),
    );
  }
}
