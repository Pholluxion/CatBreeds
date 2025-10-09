import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

void main() {
  late CatDatasource datasourceSuccess;
  late CatDatasource datasourceError;

  late CatRepositoryImpl repositorySuccess;
  late CatRepositoryImpl repositoryError;

  setUp(() {
    datasourceSuccess = CatDatasourceMockImpl();
    datasourceError = CatDatasourceMockErrorImpl();
    repositorySuccess = CatRepositoryImpl(dataSource: datasourceSuccess);
    repositoryError = CatRepositoryImpl(dataSource: datasourceError);
  });

  group('CatRepositoryImpl', () {
    test('Cuando la respuesta es exitosa devuelve lista de razas', () async {
      final Result<List<CatBreedEntity>> result = await repositorySuccess
          .getBreeds(page: 0, limit: 2);
      expect(result.isRight(), true);
    });

    ///isLeft
    test('Cuando la respuesta es fallida devuelve error', () async {
      final Result<List<CatBreedEntity>> result = await repositoryError
          .getBreeds(page: 0, limit: 2);
      expect(result.isLeft(), true);
    });

    test(
      'Cuando la respuesta es exitosa al buscar por nombre devuelve lista de razas',
      () async {
        final Result<List<CatBreedEntity>> result = await repositorySuccess
            .getBreedsByQuery('rex');
        expect(result.isRight(), true);
      },
    );

    test(
      'Cuando la respuesta es fallida al buscar por nombre devuelve error',
      () async {
        final Result<List<CatBreedEntity>> result = await repositoryError
            .getBreedsByQuery('rex');
        expect(result.isLeft(), true);
      },
    );
  });
}
