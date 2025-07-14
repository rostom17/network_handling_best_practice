import '../exceptions/network_exception.dart';

class ClientException extends NetworkException {
  const ClientException({required super.message, super.statusCode, super.data});
}
