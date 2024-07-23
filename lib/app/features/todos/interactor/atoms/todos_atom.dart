import 'package:asp/asp.dart';
import 'package:self_tasks/app/core/errors/errors.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';

final todosState = atom(<TodosEntity>[]);
final todosStateError = atom<BaseException>(DefaultException(message: ''));
final todosStateLoading = atom(false);
final todosStateDetails = atom<TodosEntity?>(null);
final todosStateDerailsError =
    atom<BaseException>(DefaultException(message: ''));
