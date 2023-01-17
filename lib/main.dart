import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persuasion_app/component/message_page.dart';
import 'package:persuasion_app/message/message.dart';
import 'package:persuasion_app/component/image_page.dart';
import 'package:persuasion_app/viewModel/view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderScope(child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});

  MainViewModel viewModel = MainViewModel();

  final String title;
  double display = 1.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    viewModel.setRef(ref);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          '〜お伝えしたいこと〜',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MessagePage(),
            ImagePage(),
            Container(
                height: 80,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent, foregroundColor: Colors.black),
                    onPressed: !viewModel.visible ? null : () => viewModel.onClick(context),
                    child: Text(
                      viewModel.isFinalPage ? '求人を見る！' : '次へ',
                      style: TextStyle(fontSize: 25),
                    ))),
          ],
        ),
      ),
    );
  }
}
