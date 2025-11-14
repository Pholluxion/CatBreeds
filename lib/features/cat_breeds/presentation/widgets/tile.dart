import 'package:flutter/widgets.dart';

import 'package:cat_breed/core/app_styles.dart';

class UIDataTile extends StatelessWidget {
  const UIDataTile({required this.value, super.key, this.title});

  final String? title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (title != null)
          Text(title.toString(), style: AppTextStyles.bodyLarge),
        value,
      ],
    );
  }
}
