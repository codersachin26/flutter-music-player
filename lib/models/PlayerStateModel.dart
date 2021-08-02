import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicPlayer {
  bool isplaying;
  List<SongInfo> currentSongList;
  int idx;
  AudioPlayer audioPlayer = AudioPlayer();

  void play(String url) async {
    await audioPlayer.play(url);
  }

  void pouseSong() {
    audioPlayer.pause();
  }

  void playOrpouse(String url, int idx) {
    if (!this.isplaying || this.currentSongList[idx].uri != url) {
      this.play(url);
      this.isplaying = true;
      this.idx = idx;
    } else {
      this.isplaying = false;
      this.pouseSong();
    }
  }

  void nextSong() {
    final String url = this.currentSongList[this.idx + 1].uri;
    play(url);
    this.idx = this.idx + 1;
    this.isplaying = true;
  }

  void preSong() {
    final String url = this.currentSongList[this.idx - 1].uri;
    play(url);
    this.idx = this.idx - 1;
    this.isplaying = true;
  }
}
