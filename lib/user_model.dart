class UserModel {
  final int? id;
  final String? firstName;
  int? age;

  UserModel({required this.id, required this.firstName, required this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["firstName"],
      age: json["age"],
    );
  }
}
