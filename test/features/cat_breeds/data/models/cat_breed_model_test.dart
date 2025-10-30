import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/features/cat_breeds/data/data.dart';
import '../../mocks/mocks.dart';

void main() {
  group('CatBreedModel JSON parsing', () {
    test('should create a valid model from JSON', () {
      final breed = CatBreedModel.fromJson(mockCatBreedJson);

      expect(breed.id, 'abys');
      expect(breed.name, 'Abyssinian');
      expect(breed.origin, 'Egypt');
      expect(breed.temperament, contains('Active'));
      // más expectativas según los campos definidos
    });

    test('should throw error or handle incomplete JSON', () {
      final badJson = {'id': 'abys'};

      expect(() => CatBreedModel.fromJson(badJson), throwsA(isA<TypeError>()));
    });
  });
}
