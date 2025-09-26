import 'package:cat_breed/features/cat_breeds/data/data.dart';

class CatDatasourceMockErrorImpl implements CatDatasource {
  @override
  Future<List<CatBreedModel>> getBreedsByQuery(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Error al obtener las razas de gatos');
  }

  @override
  Future<List<CatBreedModel>> getBreeds(int page, int limit) async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Error al obtener las razas de gatos');
  }
}
