import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UITextField extends StatelessWidget {
  const UITextField({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoTextField(
        padding: const EdgeInsets.all(16.0),
        placeholder: 'Search',
        style: const TextStyle(fontSize: 16.0),
        onChanged: onChanged,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: CupertinoColors.systemGrey4),
        ),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
      _ => TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        style: const TextStyle(fontSize: 16.0),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    };
  }
}
