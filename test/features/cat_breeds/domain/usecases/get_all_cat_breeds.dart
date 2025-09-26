// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

// class GetAllCatBreedsMock extends Mock implements GetAllCatBreeds {}

// void main() {
//   late GetAllCatBreeds getAllCatBreedsMock;

//   setUp(() {
//     getAllCatBreedsMock = GetAllCatBreedsMock();
//   });

//   test('should get all cat breeds from the repository', () async {
//     final tCatBreeds = <CatBreedEntity>[];
//     final result = await getAllCatBreedsMock((page: 0, limit: 10));

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
