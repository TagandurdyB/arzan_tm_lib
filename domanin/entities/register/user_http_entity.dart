class UserRequestEntity {
  final String phone;
  final String? pass;
  final String? token;

  UserRequestEntity({
    required this.phone,
    this.pass,
    this.token,
  });
}

class UserResponseEntity {
  final int id;
  final String name;
  final String? email;
  final String? uniqueId;
  final String role;
  final String? phone;
  final String? token;
  final String? profilePhoto;
  final bool isEmpty;

  UserResponseEntity({
    required this.uniqueId,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.token,
    required this.profilePhoto,
    this.isEmpty = true,
  });
}
