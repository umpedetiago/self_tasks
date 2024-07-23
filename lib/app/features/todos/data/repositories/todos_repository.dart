import 'package:either_dart/either.dart';
import 'package:self_tasks/app/core/errors/errors.dart';
import 'package:self_tasks/app/core/services/http/i_http_service.dart';
import 'package:self_tasks/app/core/types/types.dart';
import 'package:self_tasks/app/features/todos/data/adapters/todos_adapter.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';
import 'package:self_tasks/app/features/todos/interactor/repositories/i_todos_repository.dart';

class TodosRepository implements ITodosRepository {
  final IHttpService httpService;
  TodosRepository({
    required this.httpService,
  });

  @override
  Future<Output<List<TodosEntity>>> getTodos() async {
    try {
      final response =
          await httpService.get('https://jsonplaceholder.typicode.com/todos');
      final todos = response.map((e) => TodosAdapter.fromJson(e)).toList();
      return Right(todos);
    } on BaseException catch (e) {
      return Left(DefaultException(message: e.toString()));
    } catch (e) {
      return Left(DefaultException(message: 'unexpected error'));
    }
  }

  @override
  Future<Output<TodosEntity>> getTodosDetails(TodosEntity todos) async {
    try {
      final response = await httpService
          .getDetails('https://jsonplaceholder.typicode.com/posts/${todos.id}');
      final todo = TodosAdapter.includeDetails(todos, response);
      return Right(todo);
    } catch (e) {
      return Left(DefaultException(message: 'unexpected error'));
    }
  }
}
