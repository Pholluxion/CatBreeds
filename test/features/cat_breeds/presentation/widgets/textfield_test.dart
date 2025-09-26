import 'package:cat_breed/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('UITextField', () {
    testWidgets('renders CupertinoTextField on iOS', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        _wrap(
          const UITextField(placeholder: 'Search...'),
        ),
      );

      expect(find.byType(CupertinoTextField), findsOneWidget);
      expect(find.byType(TextField), findsNothing);
      expect(find.text('Search...'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('renders TextField on Android', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        _wrap(
          const UITextField(placeholder: 'Search...'),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(CupertinoTextField), findsNothing);
      expect(find.text('Search...'), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('suffix widget is rendered', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        _wrap(
          const UITextField(
            placeholder: 'Search...',
            suffix: Icon(Icons.clear),
          ),
        ),
      );

      expect(find.byIcon(Icons.clear), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('onChanged callback is triggered', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      String changedValue = '';

      await tester.pumpWidget(
        _wrap(
          UITextField(
            placeholder: 'Search...',
            onChanged: (value) => changedValue = value,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'cat');
      expect(changedValue, equals('cat'));

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('tap outside unfocuses the field on Android', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        _wrap(UITextField(controller: controller)),
      );

      await tester.tap(find.byType(TextField));
      await tester.pumpAndSettle();

      expect(
        FocusScope.of(tester.element(find.byType(TextField))).hasFocus,
        isTrue,
      );

      await tester.tapAt(const Offset(0, 100));
      await tester.pumpAndSettle();

      expect(
        FocusScope.of(tester.element(find.byType(TextField))).hasFocus,
        isFalse,
      );
    });

    testWidgets('tap outside unfocuses the field on iOS', (tester) async {
      final controller = TextEditingController();

      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        CupertinoApp(
          home: CupertinoPageScaffold(
            child: UITextField(controller: controller),
          ),
        ),
      );

      await tester.tap(find.byType(CupertinoTextField));
      await tester.pumpAndSettle();

      expect(
        FocusScope.of(tester.element(find.byType(CupertinoTextField))).hasFocus,
        isTrue,
      );

      await tester.tapAt(const Offset(0, 100));
      await tester.pumpAndSettle();

      expect(
        FocusScope.of(tester.element(find.byType(CupertinoTextField))).hasFocus,
        isFalse,
      );

      debugDefaultTargetPlatformOverride = null;
    });
  });
}
