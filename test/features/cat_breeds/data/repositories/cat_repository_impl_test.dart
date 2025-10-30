import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import '../../mocks/mocks.dart';
import '../../mocks/mocks.mocks.dart';

void main() {
  late CatDatasource mockCatDatasource;
  late CatRepositoryImpl mockCatRepository;

  late CatBreedModel testCatBreedModel;
  late CatBreedEntity testCatBreedEntity;

  setUp(() {
    mockCatDatasource = MockCatDatasource();
    mockCatRepository = CatRepositoryImpl(dataSource: mockCatDatasource);
    testCatBreedModel = CatBreedModel.fromJson(mockCatBreedJson);
    testCatBreedEntity = CatBreedMapper.toEntity(model: testCatBreedModel);
  });

  group('CatRepositoryImpl', () {
    test('getBreeds returns list of CatBreedModel', () async {
      // arrange
      when(
        mockCatDatasource.getBreeds(limit: 10, page: 1),
      ).thenAnswer((_) async => [testCatBreedModel]);

      // act
      final result = await mockCatRepository.getBreeds(page: 1, limit: 10);

      // assert
      expect(result, isA<Right>());
      result.match(
        (l) => fail('Expected Right, got Left: $l'),
        (r) {
          expect(r, isA<List<CatBreedEntity>>());
          expect(r.first.name, testCatBreedEntity.name);
        },
      );
    });

    test('getBreedsByQuery returns list of CatBreedModel', () async {
      // arrange
      when(
        mockCatDatasource.getBreedsByQuery(query: 'Abyssinian'),
      ).thenAnswer((_) async => [testCatBreedModel]);

      // act
      final result =
          await mockCatRepository.getBreedsByQuery(query: 'Abyssinian');

      // assert
      expect(result, isA<Right>());
      result.match(
        (l) => fail('Expected Right, got Left: $l'),
        (r) {
          expect(r, isA<List<CatBreedEntity>>());
          expect(r.first.name, testCatBreedEntity.name);
        },
      );
    });

    test('getBreeds handles exceptions and returns Failure', () async {
      // arrange
      when(
        mockCatDatasource.getBreeds(limit: 10, page: 1),
      ).thenThrow(Exception('Network error'));

      // act
      final result = await mockCatRepository.getBreeds(page: 1, limit: 10);

      // assert
      expect(result, isA<Left>());
    });

    test('getBreedsByQuery handles exceptions and returns Failure', () async {
      // arrange
      when(
        mockCatDatasource.getBreedsByQuery(query: 'Abyssinian'),
      ).thenThrow(Exception('Network error'));

      // act
      final result =
          await mockCatRepository.getBreedsByQuery(query: 'Abyssinian');

      // assert
      expect(result, isA<Left>());
    });
  });
}
