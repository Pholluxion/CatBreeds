import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:cat_breed/features/breed/breed.dart';
import 'utils/dio.mocks.dart';

void main() {
  late MockDio mockDio;
  late CatApiDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = CatApiDatasourceImpl(dio: mockDio);
  });

  group('getPictureById', () {
    test('returns Picture on success', () async {
      final pictureJson = jsonDecode(readFixture('picture.json'));

      when(mockDio.get('images/4RzEwvyzz')).thenAnswer(
        (_) async => Response(
          data: pictureJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: 'images/4RzEwvyzz'),
        ),
      );

      final result = await datasource.getPictureById('4RzEwvyzz');
      expect(result.isRight(), true);
      result.match((l) => fail('Expected Right but got Left: $l'), (r) {
        expect(r.id, '4RzEwvyzz');
        expect(r.url, 'https://cdn2.thecatapi.com/images/4RzEwvyzz.png');
      });
    });

    test('returns Failure on Dio error', () async {
      when(
        mockDio.get('images/4RzEwvyzz'),
      ).thenThrow(Exception('Network error'));

      final result = await datasource.getPictureById('abc');
      expect(result.isLeft(), true);
    });
  });

  group('getPaginatedBreeds', () {
    test('returns list of Breed on success', () async {
      final breedsJson = jsonDecode(readFixture('breeds.json'));
      when(
        mockDio.get('breeds', queryParameters: {'page': 0, 'limit': 2}),
      ).thenAnswer(
        (_) async => Response(
          data: breedsJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: 'breeds'),
        ),
      );

      final result = await datasource.getPaginatedBreeds(0, 2);
      expect(result.isRight(), true);
      result.match(
        (l) => fail('Expected Right but got Left: $l'),
        (r) => expect(r.length, 2),
      );
    });

    test('returns Failure on error', () async {
      when(
        mockDio.get('breeds', queryParameters: {'page': 0, 'limit': 10}),
      ).thenThrow(Exception('Request failed'));

      final result = await datasource.getPaginatedBreeds(0, 10);
      expect(result.isLeft(), true);
    });
  });

  group('getBreedsByQuery', () {
    test('returns list of Breed on success', () async {
      final breedsJson = jsonDecode(readFixture('search.json'));
      when(
        mockDio.get('breeds/search', queryParameters: {'q': 'rex'}),
      ).thenAnswer(
        (_) async => Response(
          data: breedsJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: 'breeds/search'),
        ),
      );

      final result = await datasource.getBreedsByQuery('rex');
      expect(result.isRight(), true);
      result.match(
        (l) => fail('Expected Right but got Left: $l'),
        (r) => expect(r.first.name, 'Cornish Rex'),
      );
    });

    test('returns Failure on error', () async {
      when(
        mockDio.get('breeds/search', queryParameters: {'q': 'rex'}),
      ).thenThrow(Exception('Query error'));

      final result = await datasource.getBreedsByQuery('abys');
      expect(result.isLeft(), true);
    });
  });
}

String readFixture(String name) =>
    File('test/features/breed/data/datasources/json/$name').readAsStringSync();
