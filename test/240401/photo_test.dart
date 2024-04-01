import 'package:learn_dart_together/240401/photo/model/photo.dart';
import 'package:learn_dart_together/240401/photo/result.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/240401/photo/repository/photo_repository_impl.dart';
import 'package:learn_dart_together/240401/photo/data_source/photo_data_source.dart';

void main() {
  test('Test PhotoRepositoryImpl getPhotos method', () async {
    // Initialize dependencies
    final PhotoDataSource photoDataSource = PhotoDataSource();
    final PhotoRepositoryImpl photoRepository = PhotoRepositoryImpl(photoDataSource);

    // Set up test query
    final String queryInput1 = '바보';
    final String queryInput2 = '천재';

    // Call the method under test
    final Result<List<Photo>> result1 = await photoRepository.getPhotos(queryInput1);
    final Result<List<Photo>> result2 = await photoRepository.getPhotos(queryInput2);

    // Check the result
    expect(result1.maybeWhen(argumentError: (e) => e, orElse: () => null), isA<Exception>());
    expect(result2.maybeWhen(success: (data) => data, orElse: () => null), isA<List<Photo>>());
  });
}
