import 'package:dio/dio.dart';

import '../models/network_request_model.dart';
import '../models/result.dart';
import '../client/network_client.dart';
import '../connectivity/connectivity_checker.dart';
import '../exceptions/network_connectivity_exception.dart';
import '../exception_mapper/exception_mapper.dart';

class DioNetworkClient implements NetworkClient {
  final Dio _dio;
  final ExceptionMapper _exceptionMapper;
  final ConnectivityChecker _connectivityChecker;

  DioNetworkClient({
    required Dio dio,
    required ExceptionMapper exceptionMapper,
    required ConnectivityChecker connectivityChecker,
  }) : _dio = dio,
       _connectivityChecker = connectivityChecker,
       _exceptionMapper = exceptionMapper;

  @override
  Future<Result<T>> request<T>(
    NetworkRequestModel req, {
    required HttpMethod method,
    T Function(dynamic)? parser,
  }) async {
    try {
      if (!await _connectivityChecker.isConnected) {
        return const Failure(exception: NetworkConnectivityException());
      }

      Response response;
      final options = Options(headers: req.headers);

      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            req.path,
            queryParameters: req.queryParams,
            options: options,
          );
          break;
        case HttpMethod.post:
          response = await _dio.post(
            req.path,
            data: req.body,
            queryParameters: req.queryParams,
            options: options,
          );
          break;
        case HttpMethod.put:
          response = await _dio.put(
            req.path,
            data: req.body,
            queryParameters: req.queryParams,
            options: options,
          );
          break;
        case HttpMethod.delete:
          response = await _dio.delete(
            req.path,
            data: req.body,
            queryParameters: req.queryParams,
            options: options,
          );
          break;
        case HttpMethod.patch:
          response = await _dio.patch(
            req.path,
            data: req.body,
            queryParameters: req.queryParams,
            options: options,
          );
          break;
      }

      final data = parser != null ? parser(response.data) : response.data as T;
      return Success(data: data);
    } catch (e) {
      return Failure(exception: _exceptionMapper.mapException(e as Exception));
    }
  }
}
