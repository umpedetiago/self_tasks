import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:self_tasks/app/core/errors/base_exception.dart';
import 'package:self_tasks/app/core/errors/default_exception.dart';
import 'package:self_tasks/app/core/services/http/i_http_service.dart';
import 'package:self_tasks/app/features/todos/data/repositories/todos_repository.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';
import 'package:self_tasks/app/features/todos/interactor/repositories/i_todos_repository.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late final ITodosRepository repository;
  late final IHttpService httpService;

  setUpAll(() {
    httpService = HttpServiceMock();
    repository = TodosRepository(httpService: httpService);
  });

  group('todosRepository', () {
    test('Should return a list of todosEntity', () async {
      when(() => httpService.get(any())).thenAnswer((_) async => [
            {
              'id': 1,
              'title': 'title',
              'completed': false,
              'userId': 1,
            }
          ]);

      final result = await repository.getTodos();
      expect(result.fold((l) => l, (r) => r), isA<List<TodosEntity>>());
    });

    test('Should return a BaseExeption', () async {
      when(() => httpService.get(any()))
          .thenThrow(DefaultException(message: 'error'));

      final result = await repository.getTodos();
      expect(result.fold((l) => l, (r) => r), isA<BaseException>());
    });

    test('Should return a Exception', () async {
      when(() => httpService.get(any())).thenThrow(Exception());

      final result = await repository.getTodos();
      expect(result.fold((l) => l, (r) => r), isA<BaseException>());
    });
  });
}
