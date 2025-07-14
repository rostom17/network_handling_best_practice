import '../exceptions/network_exception.dart';

class NotFoundException extends NetworkException {
  const NotFoundException({
    super.message = "Not Found.!",
    super.statusCode = 404,
    super.data,
  });
}
