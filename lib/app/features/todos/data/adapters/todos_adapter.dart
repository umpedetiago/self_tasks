import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';

class TodosAdapter {
  static TodosEntity fromJson(Map<String, dynamic> json) {
    return TodosEntity(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  static TodosEntity includeDetails(
      TodosEntity todos, Map<String, dynamic> json) {
    return TodosEntity(
      userId: todos.userId,
      id: todos.id,
      title: todos.title,
      completed: todos.completed,
      body: json['body'],
      isFavorite: todos.isFavorite,
    );
  }
}
