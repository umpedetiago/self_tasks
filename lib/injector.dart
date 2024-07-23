import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:self_tasks/app/core/services/http/http_service.dart';
import 'package:self_tasks/app/core/services/http/i_http_service.dart';
import 'package:self_tasks/app/features/login/data/repositories/login_repository.dart';
import 'package:self_tasks/app/features/login/interector/repositories/i_login_repository.dart';
import 'package:self_tasks/app/features/todos/data/repositories/todos_repository.dart';
import 'package:self_tasks/app/features/todos/interactor/repositories/i_todos_repository.dart';

final injector = AutoInjector(on: (injector) {
  injector.add<IHttpService>(HttpService.new);
  injector.add<ITodosRepository>(TodosRepository.new);
  injector.addInstance(Dio());
  injector.add<ILoginRepository>(LoginRepository.new);
  injector.commit();
});
