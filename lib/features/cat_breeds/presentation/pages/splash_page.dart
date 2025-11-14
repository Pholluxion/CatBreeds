import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/presentation/presentation.dart';
import 'package:cat_breed/features/cat_breeds/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      body: BlocListener<CatBreedBloc, CatBreedState>(
        listener: (context, state) {
          if (state is CatBreedLoadedState) {
            context.pushReplacementNamed(CatBreedsRoutes.home.name);
          }
        },
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('CatBreed', style: AppTextStyles.headlineLarge),
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                'assets/images/cat.png',
                width: 200,
                height: 200,
              ),
            ),
            const UICircularProgressIndicator(),
            const Text('Loading...', style: AppTextStyles.headlineSmall),
          ],
        ),
      ),
    );
  }
}
