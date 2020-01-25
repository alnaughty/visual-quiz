import 'package:flutter/services.dart';
import 'package:flutter_audio_player/flutter_audio_player.dart';
import 'package:soundpool/soundpool.dart';

playAudio() async{
  AudioPlayer.addSound('assets/audio/background_music.mp3');
}
stopAudio() async{
  AudioPlayer.removeAllSound();
}