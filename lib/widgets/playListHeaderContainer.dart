import 'package:flutter/material.dart';

class PlayListHeaderContainer extends StatelessWidget {
  final String playListName;
  final String tracks;
  final IconData iconName;
  final Color iconColor;

  const PlayListHeaderContainer(
      {Key key, this.playListName, this.tracks, this.iconName, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
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
