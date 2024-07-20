import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:self_tasks/core/services/http/i_http_service.dart';
import 'package:self_tasks/features/posts/interactor/entities/post_entity.dart';
import 'package:self_tasks/features/posts/interactor/entities/repositories/i_posts_repository.dart';

class PostsRepositoryMock extends Mock implements IPostsRepository {}

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late IPostsRepository repository;
  late IHttpService httpService;

  setUpAll() {
    registerFallbackValue([]);
    repository = PostsRepositoryMock();
    httpService = HttpServiceMock();
  }

  group('PostRepository', () {
    test('Should return a list of PostEntity', () async {
      when(() => httpService.get(any())).thenAnswer((_) async => [
            {
              'id': 1,
              'title': 'title',
              'body': 'body',
              'userId': 1,
            }
          ]);

      final result = await repository.getPosts();
      expect(result, isA<List<PostEntity>>());
    });
  });
}
