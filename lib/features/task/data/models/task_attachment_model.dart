import 'dart:convert';

import '../../domain/entities/task_attachment_entity.dart';

class AttachmentModel extends AttachmentEntity {
  const AttachmentModel({
    required super.id,
    required super.name,
    required super.fileUrl,
    required super.uploadedBy,
    required super.uploadedAt,
  });

  factory AttachmentModel.fromMap(Map<String, dynamic> map) {
    return AttachmentModel(
      id: map['id'],
      name: map['name'],
      fileUrl: map['fileUrl'],
      uploadedBy: map['uploadedBy'],
      uploadedAt: DateTime.parse(map['uploadedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'fileUrl': fileUrl,
      'uploadedBy': uploadedBy,
      'uploadedAt': uploadedAt.toIso8601String(),
    };
  }

  factory AttachmentModel.fromJson(String source) =>
      AttachmentModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory AttachmentModel.fromEntity(AttachmentEntity entity) {
    return AttachmentModel(
      id: entity.id,
      name: entity.name,
      fileUrl: entity.fileUrl,
      uploadedBy: entity.uploadedBy,
      uploadedAt: entity.uploadedAt,
    );
  }

  AttachmentEntity toEntity() {
    return AttachmentEntity(
      id: id,
      name: name,
      fileUrl: fileUrl,
      uploadedBy: uploadedBy,
      uploadedAt: uploadedAt,
    );
  }
}
