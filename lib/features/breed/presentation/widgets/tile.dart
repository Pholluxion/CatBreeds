import 'package:flutter/widgets.dart';

class UIDataTile extends StatelessWidget {
  const UIDataTile({super.key, this.title, required this.value});

  final String? title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (title != null)
          Text(
            title.toString(),
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        value,
      ],
    );
  }
}
