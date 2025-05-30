import 'package:flutter/widgets.dart';

class UIPlaceholder extends StatelessWidget {
  final double width;
  final double height;

  const UIPlaceholder({super.key, this.width = 100.0, this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/placeholder.jpg',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
