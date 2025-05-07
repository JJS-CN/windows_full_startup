import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:window_manager/window_manager.dart';

///@Author jsji
///@Date 2025/5/7
///
///@Description

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebScreenState();
  }
}

class _WebScreenState extends State<WebScreen> {
  InAppWebViewController? controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isFullScreen ? null : AppBar(title: Text("data")),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    isFullScreen = true;
                    WindowManager.instance.setFullScreen(true);
                    setState(() {});
                  },
                  child: Text("全屏"),
                ),
                TextButton(
                  onPressed: () {
                    isFullScreen = false;
                    WindowManager.instance.setFullScreen(false);
                    setState(() {});
                  },
                  child: Text("退出全屏"),
                ),
              ],
            ),
            Expanded(
              child: InAppWebView(
                initialSettings: InAppWebViewSettings(),
                initialUrlRequest: URLRequest(
                  url: WebUri("https://www.zhihu.com/"),
                ),
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
