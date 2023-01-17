import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends ConsumerWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('なんかいいのありそ？'),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // CircularProgressIndicator();
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
    ),
  )
  ..loadRequest(Uri.parse(
      'https://jp.indeed.com/jobs?q=%E6%AD%A3%E7%9C%8B%E8%AD%B7%E5%B8%AB&l=%E7%A6%8F%E5%B2%A1%E7%9C%8C+%E7%A6%8F%E5%B2%A1%E5%B8%82+%E8%A5%BF%E5%8C%BA&vjk=3083805bc17137c8'));
