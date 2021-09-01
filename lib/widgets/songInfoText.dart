import 'package:flutter/material.dart';
import 'package:music_player/models/musicStateModel.dart';
import 'package:provider/provider.dart';

class SongInfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicStateModel>(
        builder: (context, model, _) => Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.getSong?.title?.substring(
                            0,
                            model.getSong.title.length > 26
                                ? 26
                                : model.getSong.title.length) ??
                        "no song",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    model.getSong?.artist?.substring(
                            0,
                            model.getSong.artist.length > 13
                                ? 13
                                : model.getSong.artist.length) ??
                        "no artits",
                    style: TextStyle(fontSize: 15, color: Colors.black38),
                  )
                ],
              ),
            ));
  }
}
