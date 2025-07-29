import 'dart:convert';

import '../../domain/entities/space_entity.dart';

class TeamModel extends SpaceEntity {
  const TeamModel({
    required super.id,
    required super.ownerId,
    required super.name,
    required super.createdAt,
    super.description,
    super.leaderId,
    super.projectsIds = const [],
    super.membersIds = const [],
    super.updatedAt,
  });

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] as String,
      teamOwnerId: map['teamOwnerId'] as String,
      name: map['name'] as String,
      description: map['description'],
      leaderId: map['leaderId'],
      projectsIds: map['projectsIds'] != null
          ? List<String>.from(map['projectsIds'])
          : [],
      membersIds: map['membersIds'] != null
          ? List<String>.from(map['membersIds'])
          : [],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teamOwnerId': ownerId,
      'name': name,
      'description': description,
      'leaderId': leaderId,
      'projectsIds': projectsIds,
      'membersIds': membersIds,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory TeamModel.fromEntity(SpaceEntity entity) => TeamModel(
    id: entity.id,
    teamOwnerId: entity.ownerId,
    name: entity.name,
    description: entity.description,
    leaderId: entity.leaderId,
    projectsIds: entity.projectsIds,
    membersIds: entity.membersIds,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
  );

  SpaceEntity toEntity() => SpaceEntity(
    id: id,
    ownerId: ownerId,
    name: name,
    description: description,
    leaderId: leaderId,
    projectsIds: projectsIds,
    membersIds: membersIds,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
