import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;

  // ✅ Future Features
  // todo add mentions: List<String>
  // todo add isEdited: bool
  // final List<String> mentions;
  // final bool isEdited;

  const CommentEntity({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    // this.mentions = const [],
    // this.isEdited = false,
  });

  CommentEntity copyWith({
    String? id,
    String? userId,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    // List<String>? mentions,
    // bool? isEdited,
  }) {
    return CommentEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      // mentions: mentions ?? this.mentions,
      // isEdited: isEdited ?? this.isEdited,
    );
  }

  @override
  List<Object?> get props => [
    id, userId, content, createdAt, updatedAt,
    // mentions,
    // isEdited,
  ];
}
