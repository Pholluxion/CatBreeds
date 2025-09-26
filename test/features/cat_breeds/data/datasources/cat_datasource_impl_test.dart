import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/features/cat_breeds/data/data.dart';

void main() {
  group('CatApiDatasource', () {
    late CatDatasource datasource;

    setUp(() {
      datasource = CatDatasourceMockImpl();
    });

    test('Cuando la respuesta es exitosa devuelve lista de razas', () async {
      final breeds = await datasource.getBreeds(0, 10);

      expect(breeds, isA<List<CatBreedModel>>());

      expect(breeds.length, 2);

      expect(breeds[0].id, 'abys');
      expect(breeds[0].name, 'Abyssinian');
      expect(breeds[0].origin, 'Egypt');
      expect(breeds[0].temperament, contains('Active'));

      expect(breeds[1].id, 'aege');
      expect(breeds[1].name, 'Aegean');
      expect(breeds[1].origin, 'Greece');
      expect(breeds[1].temperament, contains('Affectionate'));
    });

    test(
      'Cuando se busca una raza por nombre devuelve la raza correcta',
      () async {
        final breeds = await datasource.getBreedsByQuery('rex');

        expect(breeds, isA<List<CatBreedModel>>());

        expect(breeds.length, 3);

        expect(breeds[0].id, 'crex');
        expect(breeds[0].name, 'Cornish Rex');
        expect(breeds[0].origin, 'United Kingdom');
        expect(breeds[0].temperament, contains('Affectionate'));

        expect(breeds[1].id, 'drex');
        expect(breeds[1].name, 'Devon Rex');
        expect(breeds[1].origin, 'United Kingdom');
        expect(breeds[1].temperament, contains('Highly interactive'));

        expect(breeds[2].id, 'srex');
        expect(breeds[2].name, 'Selkirk Rex');
        expect(breeds[2].origin, 'United States');
        expect(breeds[2].temperament, contains('Active'));
      },
    );
  });
}
