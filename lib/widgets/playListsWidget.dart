import 'package:flutter/material.dart';
import 'package:music_player/widgets/myDecoration.dart';

class PlayListsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .76,
      width: size.width,
      decoration: myDecoration(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SongListCard(
                  listName: "All Song",
                  listIcon: Icons.music_note,
                  iconColor: Colors.deepPurple,
                ),
                SongListCard(
                  listIcon: Icons.favorite,
                  listName: "Favotite",
                  iconColor: Colors.red,
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [PlayListHeader(), NewPlayListButton()],
            ),
          ),
          MyPlayListName()
        ],
      ),
    );
  }
}

// song list card
class SongListCard extends StatelessWidget {
  final String listName;
  final IconData listIcon;
  final Color iconColor;

  const SongListCard({Key key, this.listName, this.listIcon, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .27,
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            listIcon,
            size: 40,
            color: iconColor,
          ),
          Text(
            "$listName",
            style: TextStyle(fontSize: 15, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class PlayListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("PlayList"),
    );
  }
}

class NewPlayListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.add),
    );
  }
}

// show play list name
class MyPlayListName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (BuildContext context, idx) {
            return PlayListView();
          },
        ),
      ),
    );
  }
}

class PlayListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assests/music.jpg",
      ),
      title: Text("DJ songs"),
      subtitle: Text("26 Tracks"),
    );
  }
}
