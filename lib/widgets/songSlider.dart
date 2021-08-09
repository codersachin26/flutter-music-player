import 'package:flutter/material.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:music_player/utils/db.dart';
import 'package:provider/provider.dart';

class SongSlider extends StatefulWidget {
  @override
  _SongSliderState createState() => _SongSliderState();
}

class _SongSliderState extends State<SongSlider> {
  double myvalue = 0.0;
  String curPOs = "0:0";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Slider(
            value: myvalue,
            min: 0.0,
            max: Provider.of<MusicStateModel>(context, listen: false).songLen,
            onChanged: (value) {
              setState(() {
                myvalue = value;
              });
              print(value);
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Provider.of<MusicStateModel>(context, listen: false)
                  .curentPos),
              Text(Provider.of<MusicStateModel>(context, listen: false)
                  .getSongDuration)
            ],
          ),
        )
      ],
    ));
  }
}
