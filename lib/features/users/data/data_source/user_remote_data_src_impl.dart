import 'package:network_handling_best_practice/core/network/client/network_client.dart';
import 'package:network_handling_best_practice/core/network/models/network_request_model.dart';
import 'package:network_handling_best_practice/features/users/data/data_source/user_remote_data_src.dart';
import 'package:network_handling_best_practice/features/users/data/models/user_model.dart';

class UserRemoteDataSrcImpl extends UserRemoteDataSrc {
  final NetworkClient _networkClient;

  UserRemoteDataSrcImpl({required NetworkClient networkClient})
    : _networkClient = networkClient;

  @override
  Future<List<UserModel>> getUser() async {
    final request = NetworkRequestModel(path: "/users");

    //return await _networkClient.request(request, method: HttpMethod.get)
    return [];
  }
}
