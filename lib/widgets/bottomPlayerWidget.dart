import 'package:flutter/material.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/pages/PlayerScreen.dart';
import 'package:provider/provider.dart';

class BottomPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * .11,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [SongArt(), SongTitle(), PlayorPauseIcon()],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueGrey[900],
          ),
        ),
        onTap: () {
          final MusicStateModel model =
              Provider.of<MusicStateModel>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ListenableProvider<MusicStateModel>.value(
                        value: model,
                        child: MusicPlayer(),
                      )));
        });
  }
}

//Song album Art widget
class SongArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      width: MediaQuery.of(context).size.width * .14,
      child: Image.asset(
        "assests/music.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

//song title widget
class SongTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicStateModel>(
        builder: (context, model, _) => Container(
              child: Column(
                children: [
                  Text(
                    model.getSong != null
                        ? model.getSong.title.substring(
                            0,
                            model.getSong.title.length > 26
                                ? 26
                                : model.getSong?.title?.length)
                        : "no song",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    model.getSong != null
                        ? model.getSong.artist.substring(
                            0,
                            model.getSong.artist.length > 13
                                ? 13
                                : model.getSong?.artist?.length)
                        : "no artits",
                    style: TextStyle(fontSize: 10, color: Colors.white30),
                  )
                ],
              ),
            ));
  }
}

class PlayorPauseIcon extends StatelessWidget {
  bool getPlayingState(BuildContext context) {
    return Provider.of<MusicStateModel>(context, listen: false).playing;
  }

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      Provider.of<MusicStateModel>(context, listen: false).resume();
    }

    return Consumer<MusicStateModel>(
      builder: (context, player, _) => Container(
        child: player.playing
            ? IconButton(
                onPressed: _onPressed,
                icon: Icon(
                  Icons.pause,
                  size: 40,
                ))
            : IconButton(
                onPressed: _onPressed,
                icon: Icon(
                  Icons.play_arrow,
                  size: 40,
                )),
      ),
    );
  }
}
