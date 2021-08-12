import 'package:flutter/material.dart';
import 'package:music_player/models/musicStateModel.dart';
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
        Consumer<MusicStateModel>(
          builder: (context, model, _) => Slider(
              value: model.curPosition.toDouble(),
              min: 0.0,
              max: Provider.of<MusicStateModel>(context, listen: false)
                  .songLen
                  .toDouble(),
              onChanged: (newValue) {
                setState(() {
                  model.parseDuration(newValue.toInt());
                  setState(() {
                    model.setOnChangePos(newValue.toInt());
                  });
                });
                print(newValue);
              },
              onChangeEnd: (endValue) {
                model.seekTo(endValue.toInt());
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<MusicStateModel>(
                  builder: (context, model, _) => Text(model.getAudioPos)),
              Text(Provider.of<MusicStateModel>(context, listen: false)
                  .getSongDuration)
            ],
          ),
        )
      ],
    ));
  }
}
