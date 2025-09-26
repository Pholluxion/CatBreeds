import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.dart';
import '../../mocks/mocks.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late CatDatasource mockCatDatasource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockCatDatasource = CatDatasourceImpl(httpClient: mockHttpClient);
  });

  group('CatApiDatasource', () {
    test(
        'make correct http request with empty response then returns empty list',
        () async {
      // arrange
      when(
        mockHttpClient.get(any),
      ).thenAnswer(
        (_) async => Response<dynamic>(
          data: [],
          requestOptions: RequestOptions(),
        ),
      );

      // act
      final result = await mockCatDatasource.getBreeds(
        limit: 10,
        page: 1,
      );

      // assert
      expect(result, isEmpty);
    });

    test('make correct http request with data then returns list of models',
        () async {
      // arrange
      when(
        mockHttpClient.get(any),
      ).thenAnswer(
        (_) async => Response(
          data: [mockCatBreedJson],
          requestOptions: RequestOptions(),
        ),
      );

      // act
      final result = await mockCatDatasource.getBreeds(
        limit: 10,
        page: 1,
      );

      // assert
      expect(result, isA<List<CatBreedModel>>());
      expect(result.length, 1);
      expect(result.first.name, 'Abyssinian');
    });

    test('getBreedsByQuery returns list of CatBreedModel', () async {
      // arrange
      when(
        mockHttpClient.get(any),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: [mockCatBreedJson],
        ),
      );

      // act
      final call =
          await mockCatDatasource.getBreedsByQuery(query: 'Abyssinian');

      // assert
      expect(call, isA<List<CatBreedModel>>());
      expect(call.length, 1);
      expect(call.first.name, 'Abyssinian');
    });
  });
}
