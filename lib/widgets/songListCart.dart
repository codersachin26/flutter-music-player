// song list card
import 'package:flutter/material.dart';

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
