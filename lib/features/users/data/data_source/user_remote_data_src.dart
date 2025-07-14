import 'package:network_handling_best_practice/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSrc {
  Future<List<UserModel>> getUser();
}
