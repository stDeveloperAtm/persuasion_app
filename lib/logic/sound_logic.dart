import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persuasion_app/provider/provider.dart';

class SoundLogic {
  final soundData = 'sounds/TAKUMI.mp3';
  late WidgetRef _ref;
  // final AudioPlayer _player = AudioPlayer();

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  void onChangePage(int page) {
    print(page);
    if (page == 56) {
      playAudio();
    }
  }

  AudioPlayer get audio => _ref.watch(audioPlayer);

  Future<void> playAudio() async {
    try {
      if (audio.state != PlayerState.playing) {
        await audio.play(AssetSource(soundData));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopAudio() async {
    await audio.stop();
  }
}
