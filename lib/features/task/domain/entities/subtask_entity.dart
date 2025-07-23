import 'package:equatable/equatable.dart';

class SubtaskEntity extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final String? assigneeId;
  final DateTime? deadline;

  const SubtaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.assigneeId,
    this.deadline,
  });

  SubtaskEntity copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    String? assigneeId,
    DateTime? deadline,
  }) {
    return SubtaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      assigneeId: assigneeId ?? this.assigneeId,
      deadline: deadline ?? this.deadline,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted, assigneeId, deadline];
}
