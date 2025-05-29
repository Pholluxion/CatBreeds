import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIApp extends StatelessWidget {
  const UIApp({super.key, this.routerConfig});

  final RouterConfig<Object>? routerConfig;

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoApp.router(
        title: 'Cat Breed',
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: const TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
      ),
      _ => MaterialApp.router(
        title: 'Cat Breed',
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
      ),
    };
  }
}
