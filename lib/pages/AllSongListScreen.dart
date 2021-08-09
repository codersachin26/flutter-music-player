import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:music_player/utils/db.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/dialogBox.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:provider/provider.dart';

_TrackListState trackListState;
_AllSongsState allSongsState;

class AllSongScreen extends StatefulWidget {
  @override
  _AllSongScreenState createState() => _AllSongScreenState();
}

class _AllSongScreenState extends State<AllSongScreen> {
  @override
  void initState() {
    super.initState();
    // getAllSongs();
  }

  // void getAllSongs() async {
  //   final FlutterAudioQuery audioQuery = new FlutterAudioQuery();
  //   OpenDb.allSongs = await audioQuery.getSongs();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: myDecoration(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PlayListName(
                iconName: Icons.music_note,
                playListName: "All Songs",
                iconColor: Colors.deepPurple,
              ),
              AllSongs(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllSongs extends StatefulWidget {
  @override
  _AllSongsState createState() {
    allSongsState = _AllSongsState();
    return allSongsState;
  }
}

class _AllSongsState extends State<AllSongs> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isEdit = !isEdit;
                    OpenDb.pickedSong = [];
                  });
                },
                child: isEdit ? Text("Cancel") : Text("Edit")),
            TrackList(isEdit: isEdit),
            isEdit ? EditBottomSheet() : BottomPlayerWidget()
          ],
        ),
      ),
    );
  }
}

class TrackList extends StatefulWidget {
  final bool isEdit;

  const TrackList({Key key, this.isEdit}) : super(key: key);

  @override
  _TrackListState createState() {
    trackListState = _TrackListState();
    return trackListState;
  }
}

class _TrackListState extends State<TrackList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: OpenDb.allSongs.length,
            itemBuilder: (context, idx) => SongsCard(
                  isEdit: widget.isEdit,
                  song: OpenDb.allSongs[idx],
                  idx: idx,
                )),
      ),
    );
  }
}

class SongsCard extends StatelessWidget {
  final bool isEdit;
  final SongInfo song;
  final int idx;

  const SongsCard({Key key, this.isEdit, this.song, this.idx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.music_note),
        title: Text(song.title.toString()),
        trailing: isEdit
            ? SelectBtn(
                idx: idx,
              )
            : null,
        onTap: () {
          print("pp --> ");
          isEdit
              ? selectSong(idx)
              : Provider.of<MusicStateModel>(context, listen: false)
                  .playOrpouse(idx, OpenDb.allSongs);
          print("OpenDb.pickedSong--> : ${OpenDb.pickedSong} ");
          trackListState.setState(() {});
        });
  }
}

class SelectBtn extends StatelessWidget {
  final int idx;

  const SelectBtn({Key key, this.idx}) : super(key: key);

  Color isDone() {
    if (!OpenDb.pickedSong.contains(idx)) {
      print("IDX: $idx");
      print("Contain: ${OpenDb.pickedSong.contains(idx)}");
      return Colors.grey;
    } else {
      return Colors.deepPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color isDoneColor = isDone();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.done,
              color: isDoneColor,
              // size: 5,
            )),
      ),
    );
  }
}

class EditBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.grey,
            child: IconButton(
                onPressed: () {
                  insertSongstoPlaylist("favorites");
                  allSongsState.setState(() {
                    allSongsState.isEdit = !allSongsState.isEdit;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("your song added to favorites list")));
                  print("nothing");
                },
                icon: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.red[900],
                )),
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.grey,
            alignment: Alignment.center,
            margin: EdgeInsets.zero,
            child: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => addToPlayListDialog(context));
                  print("pressed");
                },
                icon: Icon(
                  Icons.add,
                  size: 40,
                )),
          )
        ],
      ),
    );
  }
}
