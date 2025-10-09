//coverage:ignore-file

import 'package:get_it/get_it.dart';
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

/// Registers a datasource in the dependency injection container.
///
/// [T] is the type of datasource to register.
/// [useMock] determines whether to use mock implementation.
/// [datasourceFactory] is a function that creates the datasource instance.
///
/// Throws [ArgumentError] if datasourceFactory returns null.
void registerDatasource<T extends Object>({
  required bool useMock,
  required T Function(bool useMock) datasourceFactory,
}) {
  final instance = datasourceFactory(useMock);

  if (GetIt.I.isRegistered<T>()) {
    GetIt.I.unregister<T>();
  }

  GetIt.I.registerSingleton<T>(instance);
}
