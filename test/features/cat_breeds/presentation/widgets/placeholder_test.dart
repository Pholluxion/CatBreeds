import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cat_breed/core/widgets/placeholder.dart';

Widget _wrap(Widget child) => MaterialApp(home: child);

void main() {
  testWidgets('UIPlaceholder displays the asset image',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _wrap(const UIPlaceholder(width: 120, height: 80)),
    );

    expect(find.byType(UIPlaceholder), findsOneWidget);

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isA<AssetImage>());

    final assetImage = image.image as AssetImage;
    expect(assetImage.assetName, 'assets/images/placeholder.jpg');
  });

  testWidgets('UIPlaceholder applies given width and height',
      (WidgetTester tester) async {
    const width = 150.0;
    const height = 90.0;

    await tester.pumpWidget(
      _wrap(const UIPlaceholder(width: width, height: height)),
    );

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.width, width);
    expect(image.height, height);
  });
}
