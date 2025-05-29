import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIListTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;

  const UIListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoListTile(
        title: title,
        subtitle: subtitle,
        leading: leadingIcon,
        trailing: trailingIcon,
        onTap: onTap,
      ),
      _ => ListTile(
        title: title,
        subtitle: subtitle,
        leading: leadingIcon,
        trailing: trailingIcon,
        onTap: onTap,
      ),
    };
  }
}
