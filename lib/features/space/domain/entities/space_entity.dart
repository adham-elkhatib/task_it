import 'package:equatable/equatable.dart';

class SpaceEntity extends Equatable {
  final String id;
  final String ownerId;
  final String name;
  final String? description;

  final List<String> projectsIds;
  final List<String> membersIds;
  final List<String> invitedUserEmails;
  final List<String> taskIds;
  final bool isPrivate;
  final String? iconUrl;

  final DateTime createdAt;
  final DateTime? updatedAt;

  const SpaceEntity({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.createdAt,
    this.description,
    this.projectsIds = const [],
    this.membersIds = const [],
    this.invitedUserEmails = const [],
    this.taskIds = const [],
    this.isPrivate = true,
    this.iconUrl,
    this.updatedAt,
  });

  SpaceEntity copyWith({
    String? id,
    String? ownerId,
    String? name,
    String? description,
    String? leaderId,
    List<String>? projectsIds,
    List<String>? membersIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? invitedUserEmails,
    List<String>? taskIds,
    bool? isPrivate,
    String? iconUrl,
  }) {
    return SpaceEntity(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      description: description ?? this.description,
      projectsIds: projectsIds ?? this.projectsIds,
      membersIds: membersIds ?? this.membersIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      invitedUserEmails: invitedUserEmails ?? this.invitedUserEmails,
      taskIds: taskIds ?? this.taskIds,
      isPrivate: isPrivate ?? this.isPrivate,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  @override
  List<Object?> get props => [
    id,
    ownerId,
    name,
    description,
    projectsIds,
    membersIds,
    invitedUserEmails,
    taskIds,
    isPrivate,
    iconUrl,
    createdAt,
    updatedAt,
  ];
}
