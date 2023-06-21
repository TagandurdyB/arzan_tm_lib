import '../../config/vars/constants.dart';

class UserEntity {
  final int id;
  final String avatarImg;
  final String name;
  final Role role;

  UserEntity(
      {required this.id,
      required this.avatarImg,
      required this.name,
      this.role = Role.Gost});

  static UserEntity get empty => UserEntity(id: 0, avatarImg: "", name: "");
}
