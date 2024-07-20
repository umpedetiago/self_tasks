import 'package:self_tasks/features/posts/interactor/entities/post_entity.dart';

class PostAdapter {
  static PostEntity fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
