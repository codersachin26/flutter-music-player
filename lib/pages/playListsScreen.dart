import 'package:flutter/material.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playListWidgets.dart';

class PlayListsScreen extends StatefulWidget {
  const PlayListsScreen({Key key}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * .06),
          child: AppBar(
            title: Text("Music Lists"),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            decoration: myDecoration(),
            child: Column(
              children: <Widget>[PlayListsWidget(), BottomPlayerWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
