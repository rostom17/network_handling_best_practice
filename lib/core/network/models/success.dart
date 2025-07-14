import 'network_response.dart';

class Success<T> extends NetworkResponse<T> {
  @override
  final T getData;
  const Success({required this.getData});
}
