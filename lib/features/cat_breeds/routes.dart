import 'package:go_router/go_router.dart';

import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import 'package:cat_breed/features/cat_breeds/presentation/presentation.dart';

enum CatBreedsRoutes {
  home('/home', 'home'),
  detail('detail', 'detail'),
  splash('/', 'splash');

  final String path;
  final String name;

  const CatBreedsRoutes(this.path, this.name);
}

class SplashRoute extends GoRoute {
  SplashRoute()
    : super(
        path: CatBreedsRoutes.splash.path,
        name: CatBreedsRoutes.splash.name,
        builder: (context, GoRouterState state) {
          return const SplashPage();
        },
      );
}

class HomePageRoute extends GoRoute {
  HomePageRoute()
    : super(
        path: CatBreedsRoutes.home.path,
        name: CatBreedsRoutes.home.name,
        builder: (context, state) => const HomePage(),
        routes: [DetailPageRoute()],
      );
}

class DetailPageRoute extends GoRoute {
  DetailPageRoute()
    : super(
        path: CatBreedsRoutes.detail.path,
        name: CatBreedsRoutes.detail.name,
        builder: (context, state) {
          final CatBreedEntity breed = state.extra as CatBreedEntity;
          return DetailPage(breed: breed);
        },
      );
}
