import 'success.dart';
import 'failure.dart';
import '../exceptions/network_exception.dart';

abstract class NetworkResponse<T> {
  const NetworkResponse();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get getData => isSuccess ? (this as Success<T>).getData : null;

  R when<R>({
    required R Function(T data) success,
    required R Function(NetworkException exception) failure,
  }) {
    if (isSuccess) {
      return success((this as Success<T>).getData);
    } else {
      return failure((this as Failure<T>).exception);
    }
  }
}
