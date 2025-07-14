import '../exceptions/network_exception.dart';

class NetworkConnectivityException extends NetworkException {
  const NetworkConnectivityException({
    super.message = "No Internet Connection.!",
    super.statusCode,
    super.data,
  });
}
