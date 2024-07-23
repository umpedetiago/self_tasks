import 'package:asp/asp.dart';
import 'package:self_tasks/app/features/todos/interactor/atoms/todos_atom.dart';
import 'package:self_tasks/app/features/todos/interactor/entities/todos_entity.dart';
import 'package:self_tasks/app/features/todos/interactor/repositories/i_todos_repository.dart';
import 'package:self_tasks/injector.dart';

final todosAction = atomAction1<String>((set, action) {
  final repository = injector.get<ITodosRepository>();

  if (action == 'getTodos') {
    set(todosStateLoading, true);
    repository.getTodos().then((value) {
      value.fold((l) {
        set(todosStateError, l);
      }, (r) {
        set(todosState, r);
      });
    });
    set(todosStateLoading, false);
  }
}, key: 'todosAction');

final todosFavoriteAction = atomAction1<TodosEntity>((set, todos) {
  set(
      todosState,
      todosState.state.map((e) {
        if (e.id == todos.id) {
          e.isFavorite = !e.isFavorite;
        }
        return e;
      }).toList());
}, key: 'todosFavoriteAction');

final todosCompletedAction = atomAction1<TodosEntity>((set, todos) {
  set(
      todosState,
      todosState.state.map((e) {
        if (e.id == todos.id) {
          e.completed = !e.completed;
        }
        return e;
      }).toList());
}, key: 'todosCompletedAction');

final todosDetailsAction = atomAction1<TodosEntity>((set, todos) {
  final repository = injector.get<ITodosRepository>();

  set(todosStateLoading, true);
  repository.getTodosDetails(todos).then((value) {
    value.fold((l) {
      set(todosStateDerailsError, l);
    }, (r) {
      set(todosStateDetails, r);
    });
  });

  set(todosStateLoading, false);
}, key: 'todosDetailsAction');

final todosDetailsFavoriteAction = atomAction1<TodosEntity>((set, todos) {
  set(
      todosState,
      todosState.state.map((e) {
        if (e.id == todos.id) {
          e.isFavorite = !e.isFavorite;
        }
        return e;
      }).toList());
  todos.isFavorite = !todos.isFavorite;
  set(todosStateDetails, todos);
}, key: 'todosDetailsFavoriteAction');
