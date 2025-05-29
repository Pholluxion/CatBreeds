import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:cat_breed/features/features.dart';

void initializeInjection() {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.thecatapi.com/v1/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'x-api-key':
              'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
        },
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
