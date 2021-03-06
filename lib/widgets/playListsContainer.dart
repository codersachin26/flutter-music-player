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

  PlayListView({Key key, this.listname, this.idx}) : super(key: key);

  int getSongCount(BuildContext context) {
    final playlist = Provider.of<AllPlayList>(context, listen: false)
        .getPlayListByName(listname);
    return playlist.count();
  }

  @override
  Widget build(BuildContext context) {
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
              final AllPlayList model =
                  Provider.of<AllPlayList>(context, listen: false);
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      removePlayListDialog(context, listname, model));
            }),
        onTap: () {
          final MusicStateModel model1 =
              Provider.of<MusicStateModel>(context, listen: false);
          final AllPlayList model2 =
              Provider.of<AllPlayList>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MultiProvider(
                        providers: [
                          ListenableProvider<MusicStateModel>.value(
                            value: model1,
                          ),
                          ListenableProvider<AllPlayList>.value(
                            value: model2,
                          )
                        ],
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
