import 'dart:convert';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String fullName,
    required String email,
    String? pictureURL,
    String? fcmToken,
    String? teamId,
  }) : super(
    id: id,
    fullName: fullName,
    email: email,
    pictureURL: pictureURL,
    fcmToken: fcmToken,
    teamId: teamId,
  );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      pictureURL: entity.pictureURL,
      fcmToken: entity.fcmToken,
      teamId: entity.teamId,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      email: email,
      pictureURL: pictureURL,
      fcmToken: fcmToken,
      teamId: teamId,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'],
      fullName: map['fullName'],
      pictureURL: map['pictureURL'],
      fcmToken: map['fcmToken'],
      teamId: map['teamId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'pictureURL': pictureURL,
      'fcmToken': fcmToken,
      'teamId': teamId,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
