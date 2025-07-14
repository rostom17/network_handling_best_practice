import 'network_response.dart';
import '../exceptions/network_exception.dart';

class Failure<T> extends NetworkResponse<T> {
  final NetworkException exception;
  const Failure({required this.exception});
}
