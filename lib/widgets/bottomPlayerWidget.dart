import 'package:flutter/material.dart';

class BottomPlayerWidget extends StatefulWidget {
  @override
  _BottomPlayerWidgetState createState() => _BottomPlayerWidgetState();
}

class _BottomPlayerWidgetState extends State<BottomPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.height * .97,
      child: Column(
        children: [
          Row(
            children: [SongArt(), SongName(), PlayorPuaseIcon()],
          )
        ],
      ),
    );
  }
}
