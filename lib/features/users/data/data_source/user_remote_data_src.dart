import 'package:network_handling_best_practice/core/network/models/network_response.dart';
import 'package:network_handling_best_practice/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSrc {
  Future<NetworkResponse<UserModel>> getUser();
}
