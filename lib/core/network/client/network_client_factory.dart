import 'package:dio/dio.dart';
import 'package:network_handling_best_practice/core/network/interceptors/logger_interceptor.dart';
import '../config/network_config.dart';
import 'dio_network_client.dart';
import '../connectivity/connectivity_checker_impl.dart';
import '../exception_mapper/default_exception_mapper.dart';
import 'network_client.dart';

class NetworkClientFactory {
  static NetworkClient create({String? baseUrl}) {
    final dio = Dio(BaseOptions(baseUrl: NetworkConfig.baseUrl));

    List<Interceptor> interceptors = [LoggerInterceptor()];
    dio.interceptors.addAll(interceptors);

    return DioNetworkClient(
      dio: dio,
      exceptionMapper: DefaultExceptionMapper(),
      connectivityChecker: ConnectivityCheckerImpl(),
    );
  }
}
