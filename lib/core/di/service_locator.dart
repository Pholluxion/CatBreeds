//coverage:ignore-file

import 'package:go_router/go_router.dart';

abstract class ServiceLocator {
  void setUpBlocs();
  void setupUseCases();
  void setupRepositories();
  void setupDataProviders();

  void setupDependencyInjection() {
    setupDataProviders();
    setupRepositories();
    setupUseCases();
    setUpBlocs();
  }

  List<RouteBase> setupRoutes();
}
