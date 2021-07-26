import 'package:flutter/material.dart';
import 'package:music_player/widgets/bottomPlayerWidget.dart';
import 'package:music_player/widgets/myDecoration.dart';

class PlayListScreen extends StatefulWidget {
  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
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
              PlayListName(),
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

class PlayListName extends StatelessWidget {
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
                    Text("Favorite",
                        style: TextStyle(color: Colors.black, fontSize: 40)),
                    Text("26 Tracks",
                        style: TextStyle(color: Colors.black, fontSize: 14))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomRight,
                          colors: [Colors.black, Colors.blueGrey[800]]),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      size: 46,
                      color: Colors.red[900],
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

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container());
  }
}
