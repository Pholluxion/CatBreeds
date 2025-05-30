import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/features.dart';
import 'package:cat_breed/injection_container.dart';
import 'package:cat_breed/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<BreedBloc>()..add(LoadBreeds()),
        ),
        BlocProvider(create: (context) => GetIt.I.get<PictureBloc>()),
      ],
      child: UIApp(routerConfig: router),
    );
  }
}
