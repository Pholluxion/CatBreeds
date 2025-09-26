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
          title: 'CatBreed',
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: const CupertinoThemeData(
            primaryColor: Color(0xFF6A3DE8),
            textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: CupertinoColors.black,
              ),
            ),
          ),
        ),
      _ => MaterialApp.router(
          title: 'CatBreed',
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            primaryColor: const Color(0xFF6A3DE8),
          ),
        ),
    };
  }
}
