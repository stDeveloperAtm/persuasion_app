import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visibleProvider = StateProvider<bool>((ref) => true);
final imageVisibleProvider = StateProvider<bool>((ref) => true);
final isFinalPageProvider = StateProvider<bool>((ref) => false);

final pageControllerProvider =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));

final pageCountProvider = StateProvider<int>((ref) => 0);

final viewImageNumberProvider = StateProvider<int>((ref) => 0);

final audioPlayer = StateProvider<AudioPlayer>((ref) => AudioPlayer());

final progressProvider = StateProvider<int>((ref) => 0);
