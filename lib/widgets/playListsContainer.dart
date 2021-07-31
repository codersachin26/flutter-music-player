import 'package:flutter/material.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/dialogBox.dart';

_PlayListContainerState playListContainerState;

// show new playlists
class PlayListContainer extends StatefulWidget {
  @override
  _PlayListContainerState createState() {
    playListContainerState = _PlayListContainerState();
    return playListContainerState;
  }
}

class _PlayListContainerState extends State<PlayListContainer> {
  @override
  Widget build(BuildContext context) {
    print("playlistcontainer----");
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("playlists"),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // String playlistname;
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            newPlaylistDialogBox(context));
                  },
                )
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: OpenDb.playlists == null
                    ? Text("no play")
                    : ListView.builder(
                        itemCount: OpenDb.playlists.length,
                        itemBuilder: (BuildContext context, idx) {
                          print("builder----");
                          return PlayListView(
                            listname: OpenDb.playlists[idx],
                            idx: idx,
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// return a playlist
class PlayListView extends StatelessWidget {
  final Map<String, dynamic> listname;
  final int idx;

  const PlayListView({Key key, this.listname, this.idx}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.black,
        leading: Image.asset(
          "assests/music.jpg",
        ),
        title: Text(listname['name'], style: TextStyle(color: Colors.white)),
        subtitle: Text("26 tracks", style: TextStyle(color: Colors.white)),
        trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      removePlayListDialog(context, listname));
            }),
        onTap: () {
          print("onpress : ---- $listname");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SongsListScreen(
                        playList: listname,
                        playListIcon: null,
                        iconColor: null,
                      )));
        },
      ),
    );
  }
}
