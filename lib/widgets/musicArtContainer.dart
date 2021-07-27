import 'package:flutter/material.dart';

class MusicArtContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.height * 0.36,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          "assests/music.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
