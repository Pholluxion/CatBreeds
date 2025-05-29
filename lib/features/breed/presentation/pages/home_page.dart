import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/features.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      header: const Text('CatBreeds'),
      body: BlocBuilder<BreedBloc, BreedState>(
        builder: (context, state) {
          switch (state.status) {
            case BreedStatus.initial:
              return const Center(child: UICircularProgressIndicator());
            case BreedStatus.loading:
              return const Center(child: UICircularProgressIndicator());
            case BreedStatus.failure:
              return const Center(child: Text('Failed to fetch breeds'));
            case BreedStatus.success:
              if (state.breeds.isEmpty) {
                return const Center(child: Text('No breeds found'));
              }
              return ListView.builder(
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return UICard(breed: state.breeds.elementAt(index));
                },
                itemCount: state.breeds.length,
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<BreedBloc>().add(LoadBreeds());
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
