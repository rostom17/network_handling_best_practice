import '../exceptions/network_exception.dart';

class TimeoutException extends NetworkException {
  const TimeoutException({
    super.message = "Request Timeout.!",
    super.statusCode,
    super.data,
  });
}
