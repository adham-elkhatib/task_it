import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;

  // todo add mentions: List<String>
  // todo add isEdited: bool

  const CommentEntity({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });

  CommentEntity copyWith({
    String? id,
    String? userId,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CommentEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, userId, content, createdAt, updatedAt];
}
