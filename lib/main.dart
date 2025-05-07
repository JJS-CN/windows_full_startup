import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_full_startup/const/router_ext.dart';
import 'package:windows_full_startup/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
    // 设置 packageName 参数以支持 MSIX。
    packageName: 'com.full.startup',
  );

  if (Platform.isWindows) {
    //await launchAtStartup.enable();
  }
  WindowOptions windowOptions = WindowOptions(
    size: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        observers: [FlutterSmartDialog.observer],
        routes: <RouteBase>[
          GoRoute(
            path: ScreenConst.splash,
            builder: (BuildContext context, GoRouterState state) {
              return SplashScreen();
            },
            routes: [...RouterConst.appRoutes],
          ),
        ],
      ),
      builder: FlutterSmartDialog.init(),
    );
  }
}
