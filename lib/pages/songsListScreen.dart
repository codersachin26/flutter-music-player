import 'package:flutter/material.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';

class SongsListScreen extends StatefulWidget {
  final String playListName;
  final IconData playListIcon;
  final Color iconColor;

  const SongsListScreen(
      {Key key, this.playListName, this.playListIcon, this.iconColor})
      : super(key: key);
  @override
  _SongsListScreenState createState() => _SongsListScreenState(playListName);
}

class _SongsListScreenState extends State<SongsListScreen> {
  List<Map<String, dynamic>> songs;
  final String playListName;

  _SongsListScreenState(this.playListName);

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  void getSongs() async {
    songs = await getTracks(OpenDb.db, playListName);
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
                playListName: widget.playListName,
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
      height: MediaQuery.of(context).size.height * 0.15,
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

// song play list
class PlayList extends StatefulWidget {
  final List<Map<String, dynamic>> songs;
  PlayList({Key key, this.songs}) : super(key: key);

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: widget.songs == null
          ? Text("no song")
          : ListView.builder(
              itemCount: widget.songs.length,
              itemBuilder: (context, idx) {
                return SongCard(
                  song: widget.songs[idx],
                );
              },
            ),
    ));
  }
}

// song card
class SongCard extends StatelessWidget {
  final Map<String, dynamic> song;

  const SongCard({Key key, this.song}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note),
      title: Text(song['track']),
      subtitle: Text(song['artist']),
      onTap: () {},
    );
  }
}
