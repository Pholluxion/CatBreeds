import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import 'package:cat_breed/features/cat_breeds/presentation/presentation.dart';
import 'package:cat_breed/features/cat_breeds/routes.dart';

class CatDependencyInjection extends ServiceLocator {
  @override
  void setupDataProviders() {
    GetIt.I.registerLazySingleton<CatDatasource>(
      () => CatDatasourceImpl(httpClient: GetIt.I<HttpClient>()),
    );
  }

  @override
  void setupRepositories() {
    GetIt.I.registerLazySingleton<CatRepository>(
      () => CatRepositoryImpl(dataSource: GetIt.I<CatDatasource>()),
    );
  }

  @override
  void setupUseCases() {
    GetIt.I.registerLazySingleton<GetAllCatBreeds>(
      () => GetAllCatBreeds(GetIt.I<CatRepository>()),
    );

    GetIt.I.registerLazySingleton<SearchCatBreeds>(
      () => SearchCatBreeds(GetIt.I<CatRepository>()),
    );
  }

  @override
  void setUpBlocs() {
    GetIt.I.registerFactory<CatBreedBloc>(
      () =>
          CatBreedBloc(GetIt.I<GetAllCatBreeds>(), GetIt.I<SearchCatBreeds>()),
    );
  }

  @override
  List<RouteBase> setupRoutes() {
    return [HomePageRoute(), SplashRoute()];
  }
}
