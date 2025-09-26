import 'package:flutter/widgets.dart';

class UITag extends StatelessWidget {
  const UITag({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
        border: Border.all(color: const Color(0xFF000000), width: 1.0),
      ),
      child: Padding(padding: const EdgeInsets.all(2.0), child: Text(text)),
    );
  }
}
