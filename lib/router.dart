import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

import 'package:cat_breed/features/features.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          name: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final Breed breed = state.extra as Breed;
            return DetailPage(breed: breed);
          },
        ),
      ],
    ),
  ],
);
