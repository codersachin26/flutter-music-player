import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/models/playListModel.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playListHeaderContainer.dart';
import 'package:provider/provider.dart';

class SongsListScreen extends StatefulWidget {
  final Map<String, dynamic> playList;
  final IconData playListIcon;
  final Color iconColor;
  final String playListName;

  const SongsListScreen(
      {Key key,
      this.playList,
      this.playListIcon,
      this.iconColor,
      this.playListName})
      : super(key: key);
  @override
  _SongsListScreenState createState() => _SongsListScreenState(playList);
}

class _SongsListScreenState extends State<SongsListScreen> {
  final Map<String, dynamic> playList;
  List<SongInfo> songs;

  _SongsListScreenState(this.playList);

  @override
  void initState() {
    super.initState();
    getSongs();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      print("timer------");
      timer.cancel();
    });
  }

  // void getSongs() async {
  //   OpenDb.currentSongList = await getTracks(OpenDb.db, playList['tablename']);
  //   // var songs = await getPlayListTracks(OpenDb.db, playList['tablename']);
  //   // print("playList['tablename']----> $songs");
  // }

  void getSongs() async {
    final MyPlayList playList =
        OpenDb.allPlayList.getPlayListByName(widget.playListName);
    songs = await playList.getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: myDecoration(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PlayListHeaderContainer(
                iconName: widget.playListIcon,
                playListName: widget.playList['name'],
                iconColor: widget.iconColor,
              ),
              Divider(),
              PlayList(songs: this.songs),
              BottomPlayerWidget()
            ],
          ),
        ),
      ),
    );
  }
}

// songslist listview
class PlayList extends StatelessWidget {
  final List<SongInfo> songs;

  const PlayList({Key key, this.songs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.transparent,
      child: songs == null
          ? Text("no data")
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (BuildContext context, idx) {
                print("song builder---");
                return ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(songs[idx].title),
                  subtitle: Text(songs[idx].artist),
                  onTap: () {
                    Provider.of<MusicStateModel>(context, listen: false)
                        .playOrpouse(idx, songs);
                    print("onTap");
                  },
                );
              },
            ),
    ));
  }
}
