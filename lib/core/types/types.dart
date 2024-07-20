import 'package:either_dart/either.dart';

import '../errors/errors.dart';

typedef Output<T> = Either<BaseException, T>;
