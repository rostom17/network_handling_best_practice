import '../exceptions/network_exception.dart';

abstract class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => isSuccess ? (this as Success<T>).data : null;

  R when<R>({
    required R Function(T data) success,
    required R Function(NetworkException exception) failure,
  }) {
    if (isSuccess) {
      return success((this as Success<T>).data);
    } else {
      return failure((this as Failure<T>).exception);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success({required this.data});
}

class Failure<T> extends Result<T> {
  final NetworkException exception;
  const Failure({required this.exception});
}
