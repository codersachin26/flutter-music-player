import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/models/allPlayListModel.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/models/playListModel.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playListHeaderContainer.dart';
import 'package:provider/provider.dart';

class SongsListScreen extends StatefulWidget {
  final IconData playListIcon;
  final Color iconColor;
  final String playListName;

  const SongsListScreen(
      {Key key, this.playListIcon, this.iconColor, this.playListName})
      : super(key: key);
  @override
  _SongsListScreenState createState() => _SongsListScreenState();
}

class _SongsListScreenState extends State<SongsListScreen> {
  List<SongInfo> songs = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<SongInfo>> getPlayListSongs(BuildContext context) async {
    AllPlayList model = Provider.of<AllPlayList>(context, listen: false);
    MyPlayList playlist =
        model.getPlayListByName(widget.playListName.toLowerCase());
    return await playlist.getSongs();
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
                playListName: widget.playListName,
                iconColor: widget.iconColor,
              ),
              Divider(),
              Container(
                height: MediaQuery.of(context).size.height * .69,
                color: Colors.transparent,
                child: FutureBuilder<List<SongInfo>>(
                    future: getPlayListSongs(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<SongInfo>> snapshot) {
                      if (snapshot.hasData) {
                        return PlayList(songs: snapshot.data);
                      }
                      return Text("Loding......");
                    }),
              ),
              BottomPlayerWidget()
            ],
          ),
        ),
      ),
    );
  }
}

// songslist view
class PlayList extends StatelessWidget {
  final List<SongInfo> songs;

  const PlayList({Key key, this.songs}) : super(key: key);

  List<SongInfo> getSongsList() {
    return this.songs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: songs.isEmpty
          ? Text("no data")
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (BuildContext context, idx) {
                return ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(songs[idx].title),
                  subtitle: Text(songs[idx].artist),
                  onTap: () {
                    final songsList = getSongsList();
                    Provider.of<MusicStateModel>(context, listen: false)
                        .playOrpouse(idx, songsList);
                  },
                );
              },
            ),
    );
  }
}
