import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/models/allPlayListModel.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/utils/Db_services.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playListWidgets.dart';
import 'package:provider/provider.dart';

class PlayListsScreen extends StatefulWidget {
  const PlayListsScreen({Key key}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListsScreen> {
  @override
  void initState() {
    super.initState();
    // MusicDB.openDbConnection();
    getAllSongs();
  }

  void getAllSongs() async {
    final FlutterAudioQuery audioQuery = new FlutterAudioQuery();
    OpenDb.allSongs = await audioQuery.getSongs();
  }

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
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<MusicStateModel>(
                create: (context) => MusicStateModel()),
            ChangeNotifierProvider<AllPlayList>(
                create: (context) => AllPlayList())
          ],
          child: SingleChildScrollView(
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
      ),
    );
  }
}
