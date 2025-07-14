import '../exceptions/network_exception.dart';

abstract class ExceptionMapper {
  NetworkException mapException(Exception exception);
}
