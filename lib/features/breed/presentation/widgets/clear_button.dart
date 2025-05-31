import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIIconButton extends StatelessWidget {
  final Function()? onPressed;

  const UIIconButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: switch (defaultTargetPlatform) {
        TargetPlatform.iOS => Icon(
          CupertinoIcons.clear,
          color: CupertinoColors.systemGrey,
        ),
        _ => Icon(Icons.clear, color: Colors.grey),
      },
    );
  }
}
