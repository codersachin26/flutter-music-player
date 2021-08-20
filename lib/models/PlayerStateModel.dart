import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicPlayer {
  bool isplaying = false;
  List<SongInfo> currentPlayList = [];
  int idx = 0;
  String songLengh = "0:0";
  double audioTotalDuration = 0.0;
  AudioPlayer audioPlayer = AudioPlayer();

  void play(String url) async {
    await audioPlayer.play(url).then((value) => this.setAudioLen());
    // setAudioLen();
  }

  void pouse() {
    audioPlayer.pause();
  }

  void playOrpouse(String url, int idx, List<SongInfo> playList) {
    if (!this.isplaying || this.currentPlayList[idx].uri != url) {
      this.play(url);
      this.isplaying = true;
      this.idx = idx;
      this.currentPlayList = playList;
    } else {
      this.isplaying = false;
      this.pouse();
    }
  }

  void nextSong() {
    final String url = this.currentPlayList[this.idx + 1].uri;
    play(url);
    this.idx = this.idx + 1;
    this.isplaying = true;
    print("nestSongTap--->");
  }

  void preSong() {
    final String url = this.currentPlayList[this.idx - 1].uri;
    play(url);
    this.idx = this.idx - 1;
    this.isplaying = true;
    print("preSongTap--->");
  }

  void rePlay() {
    this.audioPlayer.resume();
  }

  void setAudioLen() async {
    int audioDuration = await this.audioPlayer.getDuration();
    print("int Duration------->$audioDuration");
    this.audioTotalDuration = audioDuration / 60;
    Duration len = Duration(milliseconds: audioDuration);
    this.songLengh = "${len.inMinutes}:${len.inSeconds % 60}";
    print("Mitnues --->>>> ${len.inMinutes}");
    print("Seconds --->>>> ${len.inSeconds % 60}");
  }
}
