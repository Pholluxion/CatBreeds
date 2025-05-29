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

  GetIt.I.registerLazySingleton<CatDatasource>(
    () => CatApiDatasourceImpl(dio: GetIt.I<Dio>()),
  );

  GetIt.I.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(GetIt.I<CatDatasource>()),
  );

  GetIt.I.registerLazySingleton<GetPaginatedBreeds>(
    () => GetPaginatedBreeds(GetIt.I<CatRepository>()),
  );

  GetIt.I.registerLazySingleton<GetPictureById>(
    () => GetPictureById(GetIt.I<CatRepository>()),
  );

  GetIt.I.registerFactory<BreedBloc>(
    () => BreedBloc(GetIt.I<GetPaginatedBreeds>()),
  );

  GetIt.I.registerFactory<PictureBloc>(
    () => PictureBloc(GetIt.I<GetPictureById>()),
  );
}
