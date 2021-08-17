import 'package:flutter/material.dart';
import 'package:music_player/models/allPlayListModel.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:music_player/widgets/dialogBox.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    final AllPlayList model =
                        Provider.of<AllPlayList>(context, listen: false);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return newPlaylistDialogBox(context, model);
                        });
                  },
                )
              ],
            ),
            Expanded(
              child: Consumer<AllPlayList>(
                builder: (context, model, _) => FutureBuilder<List<String>>(
                    future: model.getAllPlayListName(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          color: Colors.transparent,
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, idx) {
                              return PlayListView(
                                listname: snapshot.data[idx],
                                idx: idx,
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: Text("Loding......"),
                      );
                    }),
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
  final String listname;
  final int idx;
  // int count;

  PlayListView({Key key, this.listname, this.idx}) : super(key: key);

  int getSongCount(BuildContext context) {
    final playlist = Provider.of<AllPlayList>(context, listen: false)
        .getPlayListByName(listname);
    return playlist.count();
  }

  @override
  Widget build(BuildContext context) {
    // this.count = getSongCount(context);
    print("ininini---===----");
    return Card(
      child: ListTile(
        tileColor: Colors.black,
        leading: Image.asset(
          "assests/music.jpg",
        ),
        title: Text(listname, style: TextStyle(color: Colors.white)),
        subtitle: Text("26", style: TextStyle(color: Colors.white)),
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
          final MusicStateModel model =
              Provider.of<MusicStateModel>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ListenableProvider<MusicStateModel>.value(
                        value: model,
                        child: SongsListScreen(
                          playListName: listname,
                          playListIcon: null,
                          iconColor: null,
                        ),
                      )));
        },
      ),
    );
  }
}
