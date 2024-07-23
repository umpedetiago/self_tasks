import 'package:flutter_test/flutter_test.dart';
import 'package:self_tasks/app/features/todos/data/adapters/todos_adapter.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';

void main() {
  test('todos adapter ...', () async {
    final result = TodosAdapter.fromJson({
      'id': 1,
      'title': 'title',
      'completed': false,
      'userId': 1,
    });
    expect(result, isA<TodosEntity>());
    expect(result.completed, false);
    expect(result.id, 1);
    expect(result.title, 'title');
    expect(result.userId, 1);
  });
}
