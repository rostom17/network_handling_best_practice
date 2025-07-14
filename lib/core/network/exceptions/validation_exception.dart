import '../exceptions/network_exception.dart';

class ValidationException extends NetworkException {
  ValidationException({
    super.message = "Validation failed.!",
    super.statusCode = 422,
    super.data,
  });
}
