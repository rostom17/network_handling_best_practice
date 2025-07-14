import '../models/network_request_model.dart';
import '../models/network_response.dart';

abstract class NetworkClient {
  Future<NetworkResponse<T>> request<T>(
    NetworkRequestModel request, {
    required HttpMethod method,
    T Function(dynamic)? parser,
  });
}

enum HttpMethod { get, post, put, delete, patch }
