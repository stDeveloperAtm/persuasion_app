import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persuasion_app/message/message.dart';
import 'package:persuasion_app/model/message_model.dart';
import 'package:persuasion_app/viewModel/view_model.dart';

class MessagePage extends ConsumerWidget {
  MessagePage({Key? key}) : super(key: key);
  PageViewModel viewModel = PageViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    viewModel.setRef(ref);
    return SizedBox(
      height: 200,
      child: AnimatedOpacity(
        opacity: viewModel.visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: viewModel.pageController,
          onPageChanged: (page) => viewModel.onChangePage(page),
          children: [
            for (int i = 0; i < viewModel.itemCount; i++) ...{
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    // '${viewModel.getMessage(i)}',
                    viewModel.m,
                    style: const TextStyle(fontSize: 30),
                  ))
            }
          ],
        ),
      ),
    );
  }
}
