import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicStateModel extends ChangeNotifier {
  bool isPlaying = false;
  List<SongInfo> currentSongList;
  int idx = 0;
  int songLen;
  int curPosition = 0;
  String audioDuration = "0:0";
  String curentPos = "0:0";
  AudioPlayer audioPlayer = AudioPlayer();

  // get current song
  SongInfo get getSong =>
      this.currentSongList == null ? null : this.currentSongList[this.idx];

  // get song duration
  String get getSongDuration => this.audioDuration;

  // get audio postion
  String get getAudioPos => this.curentPos;

  // get audio player
  AudioPlayer get getPlayer => this.audioPlayer;

  // isplaying
  bool get playing => this?.isPlaying;

  // play audio
  void play(String url) async {
    await audioPlayer.play(url).then((value) {
      this.setAudioInfo();
    });
  }

  // pause audio
  void pause() {
    audioPlayer.pause();
  }

  // play audio controller
  void playOrpouse(int idx, List<SongInfo> playlist) {
    if (!this.isPlaying || this.idx != idx) {
      this.play(playlist[idx].uri);
      this.isPlaying = true;
      this.idx = idx;
      this.currentSongList = playlist;
      print("this.currentSongList--> ${this.currentSongList}");
    } else {
      this.isPlaying = false;
      this.pause();
    }
    notifyListeners();
  }

  // next play
  void nextSong() {
    final String url = this.currentSongList[this.idx + 1].uri;
    play(url);
    this.idx = this.idx + 1;
    this.isPlaying = true;
    notifyListeners();
  }

  // previous play
  void preSong() {
    final String url = this.currentSongList[this.idx - 1].uri;
    play(url);
    this.idx = this.idx - 1;
    this.isPlaying = true;
    notifyListeners();
  }

  // resume
  void resume() {
    if (this.isPlaying) {
      this.audioPlayer.pause();
      this.isPlaying = !this.isPlaying;
    } else {
      this.audioPlayer.play(this.currentSongList[idx].uri);
      this.isPlaying = !this.isPlaying;
    }
    notifyListeners();
  }

  // set audio info
  void setAudioInfo() async {
    await this.audioPlayer.getDuration().then((audioDuration) {
      print("int Duration------->$audioDuration");
      Duration len = Duration(milliseconds: audioDuration);
      this.songLen = len.inSeconds;
      print("int songLen------->$songLen");
      this.audioDuration = "${len.inMinutes}:${len.inSeconds % 60}";
      print("Mitnues --->>>> ${len.inMinutes}");
      print("Seconds --->>>> ${len.inSeconds % 60}");
      this.currentPOs();
    });
  }

  void setCurrentSongList(List<SongInfo> playList) {
    this.currentSongList = playList;
    notifyListeners();
  }

  void currentPOs() {
    this.audioPlayer.onAudioPositionChanged.listen((Duration p) {
      // print("curretn------> $p");
      Duration len = Duration(milliseconds: p.inMilliseconds);
      this.curPosition = len.inSeconds;
      this.curentPos = "${len.inMinutes}:${len.inSeconds % 60}";
      print("curPosition------> ${this.curPosition}");
      notifyListeners();
    });
  }

  void parseDuration(int duration) {
    this.curentPos = "${duration ~/ 60}:${duration % 60}";
    print("this.curentPos----------?> ${this.curentPos}");
    notifyListeners();
  }

  void seekTo(int position) {
    this.audioPlayer.seek(Duration(seconds: position));
  }

  void setOnChangePos(int pos) {
    this.curPosition = pos;
    notifyListeners();
  }
}
