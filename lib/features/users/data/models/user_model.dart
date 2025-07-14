import 'package:network_handling_best_practice/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["firstName"],
      age: json["age"],
    );
  }

  factory UserModel.entity(UserEntity user) {
    return UserModel(
      id: user.id ?? -1,
      firstName: user.firstName ?? "Unknown",
      age: user.age ?? 00,
    );
  }
}
