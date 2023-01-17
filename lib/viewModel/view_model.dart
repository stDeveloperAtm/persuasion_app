import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persuasion_app/logic/logic.dart';
import 'package:persuasion_app/logic/sound_logic.dart';
import 'package:persuasion_app/model/message_model.dart';
import 'package:persuasion_app/page/web_page.dart';
import 'package:persuasion_app/provider/provider.dart';

class MainViewModel {
  late WidgetRef _ref;
  PageLogic logic = PageLogic();
  SoundLogic soundLogic = SoundLogic();

  void setRef(WidgetRef ref) {
    _ref = ref;
    soundLogic.setRef(ref);
  }

  List<MessageModel> get items => logic.items;
  bool get visible => _ref.watch(visibleProvider);
  bool get isFinalPage => _ref.watch(isFinalPageProvider);

  void onClick(BuildContext context) {
    if (!isFinalPage) {
      _ref.read(visibleProvider.notifier).state = false;
      _ref
          .read(pageControllerProvider)
          .nextPage(duration: Duration(milliseconds: 1500), curve: Curves.fastOutSlowIn);
      Future.delayed(Duration(milliseconds: 1000), () {
        _ref.read(visibleProvider.notifier).state = true;
      });

      if (items[_ref.read(pageCountProvider)].imageNo !=
          items[_ref.read(pageCountProvider) + 1].imageNo) {
        _ref.read(imageVisibleProvider.notifier).state = false;
        Future.delayed(Duration(milliseconds: 1000), () {
          _ref.read(imageVisibleProvider.notifier).state = true;
        });
      }
    } else {
      soundLogic.stopAudio();
      Navigator.push(context, MaterialPageRoute(builder: (context) => WebPage()));
    }
  }
}

class PageViewModel {
  late WidgetRef _ref;
  PageLogic logic = PageLogic();
  SoundLogic soundLogic = SoundLogic();

  void setRef(WidgetRef ref) {
    _ref = ref;
    soundLogic.setRef(ref);
  }

  bool get visible => _ref.watch(visibleProvider);
  PageController get pageController => _ref.read(pageControllerProvider);
  int get itemCount => logic.itemCount;
  List<MessageModel> get items => logic.items;
  String get m => items[_ref.watch(pageCountProvider)].message;

  void onChangePage(int page) {
    _ref.read(pageCountProvider.notifier).state = page;
    _ref.read(viewImageNumberProvider.notifier).state = items[page].imageNo;
    soundLogic.onChangePage(page);

    print(items.length);
    print(page);
    if ((items.length - 1) == page) {
      _ref.read(isFinalPageProvider.notifier).state = true;
    } else {
      _ref.read(isFinalPageProvider.notifier).state = false;
    }
  }

  String getMessage(int i) {
    // _ref.watch(viewImageNumberProvider.notifier).state = page;
    print(i);
    return items[i].message;
  }
}

class ImageViewModel {
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  bool get imageVisible => _ref.watch(imageVisibleProvider);
  int get pageCount => _ref.watch(pageCountProvider);
  int get viewImageNumber => _ref.watch(viewImageNumberProvider);
}
