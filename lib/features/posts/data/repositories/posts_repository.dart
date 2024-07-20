import 'package:either_dart/either.dart';
import 'package:self_tasks/core/errors/errors.dart';
import 'package:self_tasks/core/services/http/i_http_service.dart';
import 'package:self_tasks/core/types/types.dart';
import 'package:self_tasks/features/posts/data/adapters/post_adapter.dart';
import 'package:self_tasks/features/posts/interactor/entities/post_entity.dart';
import 'package:self_tasks/features/posts/interactor/entities/repositories/i_posts_repository.dart';

class PostsRepository implements IPostsRepository {
  final IHttpService httpService;
  PostsRepository({
    required this.httpService,
  });

  @override
  Future<Output<List<PostEntity>>> getPosts() async {
    try {
      final response =
          await httpService.get('https://jsonplaceholder.typicode.com/posts');
      final List<PostEntity> posts =
          response.map((e) => PostAdapter.fromJson(e)).toList();
      return Right(posts);
    } catch (e) {
      return Left(DefaultException(message: e.toString()));
    }
  }
}
