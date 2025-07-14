import '../exceptions/network_exception.dart';

class UnauhorizedException extends NetworkException {
  const UnauhorizedException({
    super.message = "Unauthorized, access denied.!",
    super.statusCode = 401,
    super.data,
  });
}
