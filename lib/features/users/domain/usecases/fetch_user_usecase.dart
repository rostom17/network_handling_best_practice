import 'package:network_handling_best_practice/features/users/domain/entities/user_entity.dart';
import 'package:network_handling_best_practice/features/users/domain/repositories/user_repository.dart';

class FetchUserUsecase {
  final UserRepository userRepository;

  const FetchUserUsecase({required this.userRepository});

  Future<List<UserEntity>> getProduct() async {
    return await userRepository.fetchUser();
  }
}
