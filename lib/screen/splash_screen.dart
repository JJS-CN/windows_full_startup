import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:windows_full_startup/const/router_ext.dart';

///@Author jsji
///@Date 2025/5/7
///
///@Description
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1)).then((v) {
      if (mounted) {
        GoRouter.of(context).go(ScreenConst.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("SplashScreen")));
  }
}
