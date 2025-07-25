import 'package:equatable/equatable.dart';

class SubtaskEntity extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final List<String>? assigneeIds;
  final DateTime? deadline;

  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  const SubtaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.assigneeIds,
    this.deadline,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  SubtaskEntity copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    List<String>? assigneeIds,
    DateTime? deadline,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) {
    return SubtaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      assigneeIds: assigneeIds ?? this.assigneeIds,
      deadline: deadline ?? this.deadline,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    isCompleted,
    assigneeIds,
    deadline,
    createdBy,
    createdAt,
    updatedBy,
    updatedAt,
  ];
}
