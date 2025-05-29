import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

import 'package:cat_breed/features/features.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final Breed breed = state.extra as Breed;
            return DetailPage(breed: breed);
          },
        ),
      ],
    ),
  ],
);
