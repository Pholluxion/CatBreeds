import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIScaffold extends StatelessWidget {
  final Widget body;
  final Widget? header;
  const UIScaffold({super.key, required this.body, required this.header});

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: header),
        child: body,
      ),
      _ => Scaffold(
        body: body,
        appBar: AppBar(title: header),
      ),
    };
  }
}
