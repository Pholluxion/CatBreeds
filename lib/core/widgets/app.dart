import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cat_breed/core/app_styles.dart';

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
          primaryColor: AppColors.primary,
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
          primaryColor: AppColors.primary,
        ),
      ),
    };
  }
}
