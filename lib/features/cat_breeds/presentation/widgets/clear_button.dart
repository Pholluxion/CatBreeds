import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIIconButton extends StatelessWidget {
  final Function()? onPressed;

  const UIIconButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onPressed,
      child: switch (defaultTargetPlatform) {
        TargetPlatform.iOS => const Icon(
          CupertinoIcons.clear,
          color: CupertinoColors.systemGrey,
          semanticLabel: 'Clear',
        ),
        _ => const Icon(
          Icons.clear,
          color: Colors.grey,
          semanticLabel: 'Clear',
        ),
      },
    );
  }
}
