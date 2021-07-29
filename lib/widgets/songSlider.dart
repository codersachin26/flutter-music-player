import 'package:flutter/material.dart';

class SongSlider extends StatefulWidget {
  @override
  _SongSliderState createState() => _SongSliderState();
}

class _SongSliderState extends State<SongSlider> {
  double myvalue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Slider(
            value: myvalue,
            onChanged: (value) {
              setState(() {
                myvalue = value;
              });
              print(myvalue);
            }));
  }
}
