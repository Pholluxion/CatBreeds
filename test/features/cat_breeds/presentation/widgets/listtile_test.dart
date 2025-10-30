import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/core/core.dart';

void main() {
  group('UIListTile', () {
    testWidgets('renders ListTile on Android', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIListTile(
              title: Text('Title'),
              subtitle: Text('Subtitle'),
              leadingIcon: Icon(Icons.pets),
              trailingIcon: Icon(Icons.chevron_right),
            ),
          ),
        ),
      );

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.byIcon(Icons.pets), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);

      debugDefaultTargetPlatformOverride = null; // reset
    });

    testWidgets('renders CupertinoListTile on iOS',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        const CupertinoApp(
          home: UIListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
          ),
        ),
      );

      expect(find.byType(CupertinoListTile), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null; // reset
    });

    testWidgets('Calls onTap when tapped', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIListTile(
              title: const Text('Tap Test'),
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tap Test'));
      await tester.pumpAndSettle();

      expect(tapped, true);

      debugDefaultTargetPlatformOverride = null; // reset
    });
  });
}
