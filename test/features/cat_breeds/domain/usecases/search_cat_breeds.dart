// import 'package:cat_breed/features/cat_breeds/data/data.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

// class SearchCatBreedsMock extends Mock implements SearchCatBreeds {}

// void main() {
//   late SearchCatBreeds searchCatBreedsMock;
//   late CatDatasource catDatasource;
//   late CatRepository catRepository;

//   setUp(() {
//     searchCatBreedsMock = SearchCatBreedsMock();
//     catDatasource = CatDatasourceMockImpl();
//     catRepository = CatRepositoryImpl(catDataSource: catDatasource);
//   });

//   test('should search cat breeds from the repository', () async {
//     final tCatBreeds = <CatBreedEntity>[];
//     final result = await searchCatBreedsMock('Siberian');

//     result.fold(
//       (error) {
//         fail('Expected success but got failure: $error');
//       },
//       (data) {
//         expect(data, tCatBreeds);
//       },
//     );
//   });
// }
