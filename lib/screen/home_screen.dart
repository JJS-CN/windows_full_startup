import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:windows_full_startup/const/router_ext.dart';

///@Author jsji
///@Date 2025/5/7
///
///@Description
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Text("HomeScreen")),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(ScreenConst.web);
            },
            child: Text("web页面"),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(ScreenConst.setting);
            },
            child: Text("setting页面"),
          ),
        ],
      ),
    );
  }
}
