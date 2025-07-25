import 'package:equatable/equatable.dart';

class AttachmentEntity extends Equatable {
  final String id;
  final String name;
  final String fileUrl;
  final String uploadedBy;
  final DateTime uploadedAt;

  const AttachmentEntity({
    required this.id,
    required this.name,
    required this.fileUrl,
    required this.uploadedBy,
    required this.uploadedAt,
  });

  AttachmentEntity copyWith({
    String? id,
    String? name,
    String? fileUrl,
    String? uploadedBy,
    DateTime? uploadedAt,
  }) {
    return AttachmentEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      fileUrl: fileUrl ?? this.fileUrl,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, fileUrl, uploadedBy, uploadedAt];
}
