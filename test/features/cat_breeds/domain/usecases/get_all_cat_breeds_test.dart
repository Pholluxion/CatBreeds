import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import '../../mocks/mocks.dart';
import '../../mocks/mocks.mocks.dart';

void main() {
  late GetAllCatBreeds getAllCatBreeds;
  late CatRepository mockCatRepository;
  late CatDatasource mockCatDatasource;

  setUp(() {
    mockCatRepository = MockCatRepository();
    mockCatDatasource = MockCatDatasource();
    getAllCatBreeds = GetAllCatBreeds(mockCatRepository);
  });

  group('GetAllCatBreeds Usecase', () {
    test('should return empty list when no cat breeds are found', () async {
      // arrange
      provideDummy<Either<Failure, List<CatBreedEntity>>>(
        const Right(<CatBreedEntity>[]),
      );

      when(
        mockCatRepository.getBreeds(limit: 1, page: 1),
      ).thenAnswer((_) async => const Right(<CatBreedEntity>[]));

      // act
      final result = await getAllCatBreeds((page: 1, limit: 1));

      // assert
      result.fold(
        (l) => fail('Expected Right but got Left'),
        (r) => expect(r, isEmpty),
      );
    });

    test(
      'should return list of CatBreedEntity when breeds are found',
      () async {
        // arrange
        provideDummy<Either<Failure, List<CatBreedEntity>>>(
          Right(<CatBreedEntity>[mockCatBreedEntity]),
        );

        when(
          mockCatRepository.getBreeds(limit: 10, page: 1),
        ).thenAnswer((_) async => Right(<CatBreedEntity>[mockCatBreedEntity]));

        // act
        final result = await getAllCatBreeds((page: 1, limit: 10));

        // assert
        expect(result, isA<Right>());
        result.match((l) => fail('Expected Right, got Left: $l'), (r) {
          expect(r, isA<List<CatBreedEntity>>());
          expect(r.first.name, mockCatBreedEntity.name);
        });
      },
    );

    test('should return Failure when repository throws an exception', () async {
      // arrange
      provideDummy<Either<Failure, List<CatBreedEntity>>>(
        Left(Failure('Error fetching breeds')),
      );

      when(
        mockCatDatasource.getBreeds(limit: 10, page: 1),
      ).thenThrow(Exception('Repository error'));

      // act
      final result = await getAllCatBreeds((page: 1, limit: 10));

      // assert
      expect(result, isA<Left>());
      result.match(
        (l) => expect(l, isA<Failure>()),
        (r) => fail('Expected Left, got Right: $r'),
      );
    });
  });
}
