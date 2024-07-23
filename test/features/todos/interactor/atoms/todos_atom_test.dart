import 'package:flutter_test/flutter_test.dart';
import 'package:self_tasks/app/core/errors/base_exception.dart';
import 'package:self_tasks/app/features/todos/interactor/actions/todos_actions.dart';
import 'package:self_tasks/app/features/todos/interactor/atoms/todos_atom.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';

void main() {
  test('todos atom gettodos', () async {
    final todos = todosState;
    todosAction('gettodos');

    expect(todos.state, isA<List<TodosEntity>>());
  });

  test('todos atom gettodos error', () async {
    final todos = todosStateError;
    todosAction('gettodos');

    expect(todos.state, isA<BaseException>());
  });
}
