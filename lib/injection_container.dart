import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:cat_breed/features/features.dart';

void initializeInjection() {
  const String apiURL = String.fromEnvironment('URL');
  const String apiKey = String.fromEnvironment('API_KEY');

  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: apiURL,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'x-api-key': apiKey},
      ),
    ),
  );

  registerDatasource<CatDatasource>(
    useMock: false,
    datasourceFactory: (useMock) => useMock
        ? CatDatasourceMockImpl()
        : CatDatasourceImpl(dio: GetIt.I<Dio>()),
  );

  GetIt.I.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(catDataSource: GetIt.I<CatDatasource>()),
  );

  GetIt.I.registerLazySingleton<GetAllCatBreeds>(
    () => GetAllCatBreeds(GetIt.I<CatRepository>()),
  );

  GetIt.I.registerLazySingleton<SearchCatBreeds>(
    () => SearchCatBreeds(GetIt.I<CatRepository>()),
  );

  GetIt.I.registerFactory<CatBreedBloc>(
    () => CatBreedBloc(GetIt.I<GetAllCatBreeds>(), GetIt.I<SearchCatBreeds>()),
  );
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
