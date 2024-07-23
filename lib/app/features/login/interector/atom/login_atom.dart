import 'package:asp/asp.dart';
import 'package:self_tasks/app/core/errors/base_exception.dart';
import 'package:self_tasks/app/core/errors/default_exception.dart';

final loginState = atom(false);
final obscurePassword = atom(true);
final loginStateError = atom<BaseException>(DefaultException(message: ''));
