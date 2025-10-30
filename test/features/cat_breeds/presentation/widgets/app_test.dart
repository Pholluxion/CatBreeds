import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/core/core.dart';

class _FakeRouterDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => const SizedBox();

  @override
  Future<void> setNewRoutePath(Object configuration) async {}
}

void main() {
  testWidgets('UIApp renders CupertinoApp on iOS', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    final routerConfig = RouterConfig(
      routerDelegate: _FakeRouterDelegate(),
    );

    await tester.pumpWidget(UIApp(routerConfig: routerConfig));

    expect(find.byType(CupertinoApp), findsOneWidget);
    expect(find.byType(MaterialApp), findsNothing);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('UIApp renders MaterialApp on Android', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    final routerConfig = RouterConfig(
      routerDelegate: _FakeRouterDelegate(),
    );

    await tester.pumpWidget(UIApp(routerConfig: routerConfig));

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(CupertinoApp), findsNothing);

    debugDefaultTargetPlatformOverride = null;
  });
}
