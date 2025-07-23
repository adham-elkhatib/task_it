
class UserEntity {
  final String id;
  final String email;
  final String? fcmToken;
  final String fullName;
  final String? pictureURL;
  final String? teamId;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    this.pictureURL,
    this.fcmToken,
    this.teamId,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? fcmToken,
    String? fullName,
    String? pictureURL,
    String? teamId,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      pictureURL: pictureURL ?? this.pictureURL,
      fcmToken: fcmToken ?? this.fcmToken,
      teamId: teamId ?? this.teamId,
    );
  }
}
