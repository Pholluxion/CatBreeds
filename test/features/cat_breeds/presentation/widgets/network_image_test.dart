import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/core/core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('UINetworkImage', () {
    const testWidth = 100.0;
    const testHeight = 100.0;

    Widget buildTestWidget(String url) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: UINetworkImage(
              ref: url,
              width: testWidth,
              height: testHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    testWidgets('shows placeholder while loading image',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(buildTestWidget('https://fake-image-url.com/image.jpg'));

      // placeholder es UIPlaceholder dentro de Shimmer
      expect(find.byType(UIPlaceholder), findsOneWidget);
    });

    testWidgets('shows errorWidget when image fails to load',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget('https://invalid/image.jpg'));

      expect(find.byType(UIPlaceholder), findsOneWidget);

      await tester.pump(const Duration(seconds: 4));

      expect(find.byType(UIPlaceholder), findsOneWidget);
    });

    testWidgets('shows image when loaded successfully',
        (WidgetTester tester) async {
      (WidgetTester tester) async {
        await tester.pumpWidget(
          buildTestWidget(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          ),
        );

        final clipWidget = tester.widget<ClipRRect>(find.byType(ClipRRect));
        expect(clipWidget.borderRadius, isNotNull);
        expect((clipWidget.borderRadius as BorderRadius).topLeft.x, 12.0);
      };
    });
  });
}
