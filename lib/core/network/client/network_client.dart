import '../models/network_request_model.dart';
import '../models/result.dart';

abstract class NetworkClient {
  Future<Result<T>> request<T>(
    NetworkRequestModel request, {
    required HttpMethod method,
    T Function(dynamic)? parser,
  });
}

enum HttpMethod { get, post, put, delete, patch }
