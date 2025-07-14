import '../exceptions/network_exception.dart';

class UnknownException extends NetworkException {
  const UnknownException({
    super.message = "An unknown error occurred.!",
    super.statusCode,
    super.data,
  });
}
