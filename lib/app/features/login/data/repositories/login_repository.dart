import 'package:either_dart/either.dart';
import 'package:self_tasks/app/core/errors/errors.dart';
import 'package:self_tasks/app/core/types/types.dart';
import 'package:self_tasks/app/features/login/interector/repositories/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  @override
  Future<Output<bool>> login(
      {required ({String userName, String password}) credentials}) async {
    try {
      if (credentials.userName == 'admin' && credentials.password == 'admin') {
        return const Right(true);
      } else {
        if (credentials.userName == 'admin') {
          return Left(DefaultException(message: 'invalid password'));
        }
        if (credentials.password == 'admin') {
          return Left(DefaultException(message: 'invalid username'));
        }
        return Left(DefaultException(message: 'invalid credentials'));
      }
    } on BaseException catch (e) {
      return Left(DefaultException(message: e.message));
    } catch (e) {
      return Left(DefaultException(message: 'unexpected error'));
    }
  }
}
