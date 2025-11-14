import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import '../../mocks/mocks.dart';
import '../../mocks/mocks.mocks.dart';

void main() {
  late CatRepository mockCatRepository;
  late SearchCatBreeds searchCatBreeds;
  late CatDatasource mockCatDatasource;

  setUp(() {
    mockCatDatasource = MockCatDatasource();
    mockCatRepository = MockCatRepository();
    searchCatBreeds = SearchCatBreeds(mockCatRepository);
  });

  group('SearchCatBreeds Usecase', () {
    test('should return empty list when no cat breeds are found', () async {
      // arrange
      provideDummy<Either<Failure, List<CatBreedEntity>>>(
        const Right(<CatBreedEntity>[]),
      );

      when(
        mockCatRepository.getBreedsByQuery(query: 'Abyssinian'),
      ).thenAnswer((_) async => const Right(<CatBreedEntity>[]));

      // act
      final result = await searchCatBreeds('Abyssinian');

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
          mockCatRepository.getBreedsByQuery(query: 'Abyssinian'),
        ).thenAnswer((_) async => Right(<CatBreedEntity>[mockCatBreedEntity]));

        // act
        final result = await searchCatBreeds('Abyssinian');

        // assert
        result.fold((l) => fail('Expected Right but got Left'), (r) {
          expect(r, isNotEmpty);
          expect(r.first.name, mockCatBreedEntity.name);
        });
      },
    );

    test('should return Failure when repository throws an exception', () async {
      // arrange
      provideDummy<Either<Failure, List<CatBreedEntity>>>(
        Left(Failure('Error fetching breeds by query')),
      );

      when(
        mockCatDatasource.getBreedsByQuery(query: 'Abyssinian'),
      ).thenThrow(Exception('Repository error'));

      // act
      final result = await searchCatBreeds('Abyssinian');

      // assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => fail('Expected Left but got Right'),
      );
    });
  });
}
