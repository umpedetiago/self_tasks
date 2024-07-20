import 'package:self_tasks/core/types/types.dart';
import 'package:self_tasks/features/posts/interactor/entities/post_entity.dart';

abstract class IPostsRepository {
  Future<Output<List<PostEntity>>> getPosts();
}
