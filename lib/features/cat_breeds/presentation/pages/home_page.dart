import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/presentation/presentation.dart';
import 'package:cat_breed/features/cat_breeds/presentation/widgets/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController scrollController;
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    searchController = TextEditingController();
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      header: const Text('CatBreeds'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                searchController: searchController,
                onInputChanged: (value) {
                  context.read<CatBreedBloc>().add(SearchBreedsEvent(value));
                },
                onClear: () {
                  context.read<CatBreedBloc>().add(const SearchBreedsEvent(''));
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<CatBreedBloc, CatBreedState>(
                builder: (context, state) {
                  return switch (state) {
                    CatBreedLoadingState() => const Center(
                        child: UICircularProgressIndicator(),
                      ),
                    CatBreedLoadError() => const Center(
                        child: Text('Failed to fetch breeds'),
                      ),
                    CatBreedLoadedState(:final breeds) => ListView.builder(
                        itemCount: breeds.length,
                        controller: scrollController,
                        itemBuilder: (BuildContext context, int index) =>
                            UICard(breed: breeds.elementAt(index)),
                      ),
                    CatBreedEmptyState() => const Center(
                        child: Text('No breeds found'),
                      ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && searchController.text.isEmpty) {
      context.read<CatBreedBloc>().add(const LoadBreedsEvent());
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
