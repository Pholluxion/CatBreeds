import 'package:cat_breed/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UICircularProgressIndicator', () {
    testWidgets('renders CupertinoActivityIndicator on iOS', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        const CupertinoApp(
          home: CupertinoPageScaffold(child: UICircularProgressIndicator()),
        ),
      );

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('renders CircularProgressIndicator on Android', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: UICircularProgressIndicator()),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(CupertinoActivityIndicator), findsNothing);

      debugDefaultTargetPlatformOverride = null;
    });
  });
}
