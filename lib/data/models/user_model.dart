class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
  });

  final String username;
  final String email;
  final int id;
  final String name;

  factory UserModel.fromJson(Map<String, Object?> json) => UserModel(
        name: json["name"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        username: json["username"] as String? ?? "",
        email: json["email"] as String? ?? "",
      );
}
