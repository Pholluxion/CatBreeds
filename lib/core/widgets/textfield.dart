import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cat_breed/core/app_styles.dart';

class UITextField extends StatelessWidget {
  const UITextField({
    super.key,
    this.onChanged,
    this.controller,
    this.suffix,
    this.placeholder,
  });

  final String? placeholder;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        onChanged: onChanged,
        suffix: suffix,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.small,
          border: Border.all(color: CupertinoColors.systemGrey4),
        ),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
      _ => TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffix,
          hintText: placeholder,
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius.small,
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    };
  }
}
