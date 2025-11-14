import 'package:flutter/widgets.dart';

import 'package:cat_breed/core/app_styles.dart';

class UITag extends StatelessWidget {
  const UITag({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.small,
        shape: BoxShape.rectangle,
        border: Border.all(color: AppColors.borderDark, width: 1.0),
      ),
      child: Padding(padding: AppSpacing.paddingXS, child: Text(text)),
    );
  }
}
