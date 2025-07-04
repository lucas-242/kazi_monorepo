abstract class AppError implements Exception {
  AppError(this.message, {this.trace});
  String message;
  StackTrace? trace;

  @override
  String toString() => message;
}

class ExternalError extends AppError {
  ExternalError(super.message, {super.trace});
}

class TimeoutError extends ExternalError {
  TimeoutError(super.message, {super.trace});
}

class ClientError extends AppError {
  ClientError(super.message, {super.trace});
}
