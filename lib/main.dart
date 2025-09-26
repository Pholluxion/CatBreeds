import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/presentation/bloc/cat_breed_bloc.dart';
import 'package:cat_breed/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<CatBreedBloc>()..add(const LoadBreedsEvent()),
      child: UIApp(routerConfig: GetIt.I<GoRouter>()),
    );
  }
}
