import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/dependency_injection.dart';

final List<DIWrapper> _diWrappers = [CatDependencyInjection()];

void initializeInjection() {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio()..interceptors.add(ApiKeyInterceptor()),
  );

  GetIt.I.registerLazySingleton<HttpClient>(
    () => DioHttpClient(dio: GetIt.I<Dio>()),
  );

  for (final diWrapper in _diWrappers) {
    diWrapper.setupDependencyInjection();
  }

  final routes = <RouteBase>[];

  for (final diWrapper in _diWrappers) {
    routes.addAll(diWrapper.setupRoutes());
  }

  GetIt.I.registerLazySingleton<GoRouter>(
    () => GoRouter(initialLocation: '/', routes: [...routes]),
  );
}
