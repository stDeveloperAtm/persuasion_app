import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persuasion_app/provider/provider.dart';

class WebPageViewModel {
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  int get prog => _ref.watch(progressProvider);

  void onProgress(int progress) {
    _ref.read(progressProvider.notifier).state = progress;
  }
}
