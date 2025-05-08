import 'dart:async';

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
  bool showAction = true;
  Timer? hoverTimer;

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
            showAction
                ? Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        isFullScreen = true;
                        WindowManager.instance.setFullScreen(true);
                        if (hoverTimer != null) {
                          hoverTimer!.cancel();
                        }
                        hoverTimer = Timer(const Duration(seconds: 3), () {
                          showAction = false;
                          setState(() {});
                        });
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
                )
                : Container(),
            Expanded(
              child: MouseRegion(
                onHover: (e) {
                  //指针在区域内移动监听,有移动时展示控制组件, n秒未移动隐藏控制组件
                  showAction = true;
                  if (hoverTimer != null) {
                    hoverTimer!.cancel();
                  }
                  hoverTimer = Timer(const Duration(seconds: 3), () {
                    showAction = false;
                    setState(() {});
                  });
                  setState(() {});
                },
                child: InAppWebView(
                  initialSettings: InAppWebViewSettings(),
                  initialUrlRequest: URLRequest(
                    url: WebUri("https://www.hypergryph.com/"),
                  ),
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
