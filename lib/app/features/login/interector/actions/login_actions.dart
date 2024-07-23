import 'package:asp/asp.dart';
import 'package:self_tasks/app/features/login/interector/atom/login_atom.dart';
import 'package:self_tasks/app/features/login/interector/repositories/i_login_repository.dart';
import 'package:self_tasks/injector.dart';

final loginAction =
    atomAction1<({String userName, String password})>((set, credentials) {
  final repository = injector.get<ILoginRepository>();
  repository.login(credentials: credentials).then((value) {
    value.fold((l) {
      set(loginStateError, l);
    }, (r) {
      set(loginState, r);
    });
  });
}, key: 'loginAction');

final obscurePasswordAction = atomAction((set) {
  set(obscurePassword, !obscurePassword.state);
}, key: 'obscurePasswordAction');
