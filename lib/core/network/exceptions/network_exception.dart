abstract class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const NetworkException({required this.message, this.statusCode, this.data});

  @override
  String toString() => "Network Exception: $message";
}
