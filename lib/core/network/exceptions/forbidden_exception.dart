import '../exceptions/network_exception.dart';

class ForbiddenException extends NetworkException {
  const ForbiddenException({
    super.message = "Access Forbidden",
    super.statusCode = 403,
    super.data,
  });
}
