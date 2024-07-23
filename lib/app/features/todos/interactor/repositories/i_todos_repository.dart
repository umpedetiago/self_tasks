import 'package:self_tasks/app/core/types/types.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';

abstract class ITodosRepository {
  Future<Output<List<TodosEntity>>> getTodos();
  Future<Output<TodosEntity>> getTodosDetails(TodosEntity todos);
}
