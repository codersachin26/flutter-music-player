import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicStateModel extends ChangeNotifier {
  bool isPlaying = false;
  List<SongInfo> currentSongList;
  int idx = 0;
  int songLen = 0;
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
    await audioPlayer.play(url, isLocal: true).then((value) {
      this.setAudioInfo();
      notifyListeners();
    });
  }

  // pause audio
  void pause() {
    audioPlayer.pause();
  }

  // play audio controller
  void playOrpouse(int idx, List<SongInfo> playlist) {
    if (!this.isPlaying || this.idx != idx) {
      if (this.isPlaying) this.audioPlayer.release();
      this.play(playlist[idx].uri);
      this.isPlaying = true;
      this.idx = idx;
      this.currentSongList = playlist;
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
    this.audioPlayer.onDurationChanged.listen((Duration audioDuration) {
      this.songLen = audioDuration.inSeconds;
      this.audioDuration =
          "${audioDuration.inMinutes}:${audioDuration.inSeconds % 60}";
      this.currentPOs();
      notifyListeners();
    });
  }

  void setCurrentSongList(List<SongInfo> playList) {
    this.currentSongList = playList;
    notifyListeners();
  }

  void currentPOs() {
    this.audioPlayer.onAudioPositionChanged.listen((Duration p) {
      Duration len = Duration(milliseconds: p.inMilliseconds);
      this.curPosition = len.inSeconds;
      this.curentPos = "${len.inMinutes}:${len.inSeconds % 60}";
      notifyListeners();
    });
  }

  void parseDuration(int duration) {
    this.curentPos = "${duration ~/ 60}:${duration % 60}";
    notifyListeners();
  }

  void seekTo(int position) {
    this.audioPlayer.seek(Duration(seconds: position));
  }

  void setOnChangePos(int pos) {
    this.curPosition = pos;
    notifyListeners();
  }

  void disposeMusicPlayer() {
    this.pause();
    this.audioPlayer.stop();
    this.audioPlayer.release();
    this.audioPlayer.dispose();
    notifyListeners();
  }
}
