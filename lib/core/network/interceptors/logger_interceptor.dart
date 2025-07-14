import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger _logger = Logger();
  final bool logRequests;
  final bool logResponses;
  final bool logErrors;

  LoggerInterceptor({
    this.logRequests = true,
    this.logResponses = true,
    this.logErrors = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (logRequests) {
      _logger.d('''
        🚀 REQUEST
        ${options.method} ${options.uri}
        Headers: ${options.headers}
        Data: ${options.data}
        Query Parameters: ${options.queryParameters}
      ''');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (logResponses) {
      _logger.d('''
          ✅ RESPONSE
          ${response.statusCode} ${response.statusMessage}
          ${response.requestOptions.method} ${response.requestOptions.uri}
          Headers: ${response.headers}
          Data: ${response.data}
      ''');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (logErrors) {
      _logger.e('''
        ❌ ERROR
        ${err.message}
        ${err.requestOptions.method} ${err.requestOptions.uri}
        Response: ${err.response?.statusCode} ${err.response?.statusMessage}
        Data: ${err.response?.data}
      ''');
    }
    super.onError(err, handler);
  }
}
