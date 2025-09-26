import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/presentation/presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              child: UITextField(
                placeholder: 'Search breeds',
                controller: searchController,
                onChanged: _onSearch,
                suffix: UIIconButton(
                  onPressed: () {
                    searchController.clear();
                    _onSearch('');
                  },
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CatBreedBloc, CatBreedState>(
                builder: (context, state) {
                  switch (state) {
                    case CatBreedLoadingState():
                      return const Center(child: UICircularProgressIndicator());
                    case CatBreedLoadError():
                      return const Center(
                        child: Text('Failed to fetch breeds'),
                      );
                    case CatBreedLoadedState():
                      if (state.breeds.isEmpty) {
                        return const Center(child: Text('No breeds found'));
                      }
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return UICard(breed: state.breeds.elementAt(index));
                    },
                    itemCount: state.breeds.length,
                  );
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
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && searchController.text.isEmpty) {
      context.read<CatBreedBloc>().add(const LoadBreedsEvent());
    }
  }

  void _onSearch(String query) {
    context.read<CatBreedBloc>().add(SearchBreedsEvent(query));
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
