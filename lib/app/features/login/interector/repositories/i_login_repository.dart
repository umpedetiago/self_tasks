import 'package:self_tasks/app/core/types/types.dart';

abstract class ILoginRepository {
  Future<Output<bool>> login(
      {required ({String userName, String password}) credentials});
}
