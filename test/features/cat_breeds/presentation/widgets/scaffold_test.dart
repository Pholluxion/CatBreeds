import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/core/core.dart';

void main() {
  group('UIScaffold', () {
    testWidgets(
        'renders CupertinoPageScaffold with navigation bar on iOS when header is provided',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        const CupertinoApp(
          home: UIScaffold(header: Text('Header'), body: Text('Body')),
        ),
      );

      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.byType(CupertinoNavigationBar), findsOneWidget);
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'renders CupertinoPageScaffold without navigation bar on iOS when header is null',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        const CupertinoApp(home: const UIScaffold(body: Text('Body'))),
      );

      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.byType(CupertinoNavigationBar), findsNothing);
      expect(find.text('Body'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'renders Scaffold with AppBar on Android when header is provided',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        const MaterialApp(
          home: UIScaffold(
            header: Text('Header'),
            body: Text('Body'),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'renders Scaffold without AppBar on Android when header is null',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        const MaterialApp(
          home: UIScaffold(
            body: Text('Body'),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsNothing);
      expect(find.text('Body'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('renders CupertinoPageScaffold when no header and on iOS',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        const CupertinoApp(home: UIScaffold(body: Text('Hola'))),
      );

      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.byType(CupertinoNavigationBar), findsNothing);

      debugDefaultTargetPlatformOverride = null;
    });
  });
}
