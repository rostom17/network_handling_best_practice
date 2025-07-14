import '../exceptions/network_exception.dart';

class ServerException extends NetworkException {
  const ServerException({required super.message, super.statusCode, super.data});
}
