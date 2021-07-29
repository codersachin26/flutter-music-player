import 'package:flutter/material.dart';

class BottomPlayerWidget extends StatefulWidget {
  @override
  _BottomPlayerWidgetState createState() => _BottomPlayerWidgetState();
}

class _BottomPlayerWidgetState extends State<BottomPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * .11,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
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
          Navigator.pushNamed(context, '/player');
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
    return Container(
      child: Column(
        children: [
          Text(
            "music_Song",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          Text(
            "Yo Yo",
            style: TextStyle(fontSize: 10, color: Colors.white30),
          )
        ],
      ),
    );
  }
}

//play or puase btn widget
class PlayorPauseIcon extends StatefulWidget {
  @override
  _PlayorPauseIconState createState() => _PlayorPauseIconState();
}

class _PlayorPauseIconState extends State<PlayorPauseIcon> {
  bool isplay = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isplay
          ? Icon(
              Icons.pause,
              size: 40,
            )
          : Icon(
              Icons.play_arrow,
              size: 40,
            ),
    );
  }
}
