import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UICircularProgressIndicator extends StatelessWidget {
  const UICircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => const CupertinoActivityIndicator(),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
