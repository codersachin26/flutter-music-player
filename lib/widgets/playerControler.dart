import 'package:flutter/material.dart';

class PlayerControler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                size: 50,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                size: 50,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 50,
              ))
        ],
      ),
    );
  }
}
