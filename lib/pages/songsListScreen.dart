import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';

class SongsListScreen extends StatefulWidget {
  final Map<String, dynamic> playList;
  final IconData playListIcon;
  final Color iconColor;

  const SongsListScreen(
      {Key key, this.playList, this.playListIcon, this.iconColor})
      : super(key: key);
  @override
  _SongsListScreenState createState() => _SongsListScreenState(playList);
}

class _SongsListScreenState extends State<SongsListScreen> {
  final Map<String, dynamic> playList;

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

  void getSongs() async {
    OpenDb.currentSongList = await getTracks(OpenDb.db, playList['tablename']);
    // var songs = await getPlayListTracks(OpenDb.db, playList['tablename']);
    // print("playList['tablename']----> $songs");
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
              PlayListName(
                iconName: widget.playListIcon,
                playListName: widget.playList['name'],
                iconColor: widget.iconColor,
              ),
              Divider(),
              PlayList(),
              BottomPlayerWidget()
            ],
          ),
        ),
      ),
    );
  }
}

// show play list name
class PlayListName extends StatelessWidget {
  final String playListName;
  final String tracks;
  final IconData iconName;
  final Color iconColor;

  const PlayListName(
      {Key key, this.playListName, this.tracks, this.iconName, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(playListName.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 35)),
                    Text(tracks.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 14))
                  ],
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomRight,
                          colors: [Colors.black, Colors.blueGrey[800]]),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: iconName == null
                        ? Image.asset(
                            "assests/music.jpg",
                            fit: BoxFit.scaleDown,
                          )
                        : Icon(
                            iconName,
                            size: 46,
                            color: iconColor,
                          ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.transparent,
      child: OpenDb.currentSongList == null
          ? Text("no data")
          : ListView.builder(
              itemCount: OpenDb.currentSongList.length,
              itemBuilder: (BuildContext context, idx) {
                print("song builder---");
                return SongCard(song: OpenDb.currentSongList[idx], idx: idx);
              },
            ),
    ));
  }
}

// song card
class SongCard extends StatelessWidget {
  final SongInfo song;
  final int idx;

  const SongCard({Key key, this.song, this.idx}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note),
      title: Text(song.title),
      subtitle: Text(song.artist),
      onTap: () {
        print("onTap");
      },
    );
  }
}
