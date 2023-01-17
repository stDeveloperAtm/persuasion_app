import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persuasion_app/viewModel/view_model.dart';

class ImagePage extends ConsumerWidget {
  ImagePage({Key? key}) : super(key: key);
  ImageViewModel viewModel = ImageViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    viewModel.setRef(ref);
    return viewModel.viewImageNumber != 0
        ? AnimatedOpacity(
            opacity: viewModel.imageVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(1), BlendMode.dstATop),
                    image: AssetImage('images/${viewModel.viewImageNumber}.png'),
                    fit: BoxFit.contain),
              ),
            ),
          )
        : Container(
            height: 350,
          );
  }
}
