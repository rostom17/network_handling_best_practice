import 'package:network_handling_best_practice/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> fetchUser();
}
