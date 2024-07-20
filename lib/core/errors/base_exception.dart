abstract class BaseException implements Exception {
  final String message;
  final String? stackTrace;

  BaseException({required this.message, this.stackTrace});
}
