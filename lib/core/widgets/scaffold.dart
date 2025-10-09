import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIScaffold extends StatelessWidget {
  final Widget body;
  final Widget? header;
  const UIScaffold({required this.body, super.key, this.header});

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoPageScaffold(
        navigationBar: buildCupertinoNavigationBar,
        child: body,
      ),
      _ => Scaffold(body: body, appBar: buildAppBar),
    };
  }

  PreferredSizeWidget? get buildAppBar {
    if (header != null) {
      return AppBar(title: header);
    }
    return null;
  }

  ObstructingPreferredSizeWidget? get buildCupertinoNavigationBar {
    if (header != null) {
      return CupertinoNavigationBar(middle: header);
    }
    return null;
  }
}
