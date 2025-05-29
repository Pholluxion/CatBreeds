import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {
  const UIButton({super.key, required this.child, required this.onPressed});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoButton(onPressed: onPressed, child: child),
      _ => ElevatedButton(onPressed: onPressed, child: child),
    };
  }
}
