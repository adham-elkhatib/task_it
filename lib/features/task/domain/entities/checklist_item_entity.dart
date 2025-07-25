import 'package:equatable/equatable.dart';

class ChecklistItemEntity extends Equatable {
  final String id;
  final String content;
  final bool isChecked;

  const ChecklistItemEntity({
    required this.id,
    required this.content,
    this.isChecked = false,
  });

  ChecklistItemEntity copyWith({String? id, String? content, bool? isChecked}) {
    return ChecklistItemEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [id, content, isChecked];
}
