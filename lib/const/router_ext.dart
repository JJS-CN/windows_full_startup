import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:windows_full_startup/screen/home_screen.dart';
import 'package:windows_full_startup/screen/setting_screen.dart';
import 'package:windows_full_startup/screen/web_screen.dart';
import '../screen/splash_screen.dart';

///@Author jsji
///@Date 2025/5/7
///
///@Description
class ScreenConst {
  static const String splash = "/";
  static const String home = "/home";
  static const String web = "/web";
  static const String setting = "/setting";
}

class RouterConst {
  static var appRoutes = <RouteBase>[
    GoRoute(
      path: ScreenConst.home,
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: ScreenConst.web,
      builder: (BuildContext context, GoRouterState state) {
        return WebScreen();
      },
    ),
    GoRoute(
      path: ScreenConst.setting,
      builder: (BuildContext context, GoRouterState state) {
        return SettingScreen();
      },
    ),
  ];
}
