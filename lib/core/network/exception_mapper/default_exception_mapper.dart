import 'package:dio/dio.dart';

import '../exceptions/forbidden_exception.dart';
import '../exceptions/network_connectivity_exception.dart';
import '../exceptions/not_found_exception.dart';
import '../exceptions/server_exception.dart';
import '../exceptions/timeout_exception.dart';
import '../exceptions/unauhorized_exception.dart';
import '../exceptions/unknown_exception.dart';
import '../exceptions/validation_exception.dart';
import '../exceptions/network_exception.dart';
import '../exceptions/client_exception.dart';
import '../exception_mapper/exception_mapper.dart';

class DefaultExceptionMapper extends ExceptionMapper {
  @override
  NetworkException mapException(Exception exception) {
    if (exception is DioException) {
      return _mapDioException(exception);
    }

    if (exception is NetworkException) {
      return exception;
    }

    return UnknownException(message: "$exception");
  }

  NetworkException _mapDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NetworkConnectivityException();

      case DioExceptionType.badResponse:
        return _mapHttpStatusCode(dioException);

      case DioExceptionType.cancel:
        return const ClientException(message: "Cancelled", statusCode: 000);

      case DioExceptionType.unknown:
        return NetworkConnectivityException(
          message: dioException.message ?? 'Unknown network error',
        );

      default:
        return UnknownException(
          message: dioException.message ?? 'An unknown error occurred',
        );
    }
  }

  NetworkException _mapHttpStatusCode(DioException dioException) {
    final statusCode = dioException.response?.statusCode;
    final data = dioException.response?.data;

    switch (statusCode) {
      case 400:
        return ClientException(
          message: 'Bad request',
          statusCode: statusCode,
          data: data,
        );
      case 401:
        return UnauhorizedException(data: data);
      case 403:
        return ForbiddenException(data: data);
      case 404:
        return NotFoundException(data: data);
      case 422:
        return ValidationException(data: data);
      case 429:
        return ClientException(
          message: 'Too many requests',
          statusCode: statusCode,
          data: data,
        );
      case 500:
        return ServerException(
          message: 'Internal server error',
          statusCode: statusCode,
          data: data,
        );
      case 502:
        return ServerException(
          message: 'Bad gateway',
          statusCode: statusCode,
          data: data,
        );
      case 503:
        return ServerException(
          message: 'Service unavailable',
          statusCode: statusCode,
          data: data,
        );
      default:
        if (statusCode != null && statusCode >= 400 && statusCode < 500) {
          return ClientException(
            message: 'Client error: $statusCode',
            statusCode: statusCode,
            data: data,
          );
        } else if (statusCode != null && statusCode >= 500) {
          return ServerException(
            message: 'Server error: $statusCode',
            statusCode: statusCode,
            data: data,
          );
        } else {
          return UnknownException(
            message: 'HTTP error: $statusCode',
            statusCode: statusCode,
            data: data,
          );
        }
    }
  }
}
