import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/breed.dart';

const kBackgroundColor = Color(0xFF6A3DE8);
const kWhiteColor = Color(0xFFFFFFFF);

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      body: BlocListener<BreedBloc, BreedState>(
        listener: (context, state) {
          if (state.status == BreedStatus.success) {
            context.pushReplacementNamed('home');
          }
        },
        child: Container(
          color: kBackgroundColor,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Cat Breed',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 100),
              Center(
                child: Image.asset(
                  'assets/images/cat.png',
                  width: 200,
                  height: 200,
                ),
              ),
              UICircularProgressIndicator(),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
