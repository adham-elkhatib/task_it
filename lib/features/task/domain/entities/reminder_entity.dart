import 'package:equatable/equatable.dart';

enum ReminderRepeatType { none, daily, weekly, monthly }

class ReminderEntity extends Equatable {
  final String id;
  final DateTime time;
  final ReminderRepeatType repeatType;

  // Future features (optional)
  // final String? taskId;
  // final String? note;
  // final bool isActive;
  // final DateTime? endDate;
  // final List<int>? weekdays;

  const ReminderEntity({
    required this.id,
    required this.time,
    this.repeatType = ReminderRepeatType.none,
    // this.taskId,
    // this.note,
    // this.isActive = true,
    // this.endDate,
    // this.weekdays,
  });

  ReminderEntity copyWith({
    String? id,
    DateTime? time,
    ReminderRepeatType? repeatType,
    // String? taskId,
    // String? note,
    // bool? isActive,
    // DateTime? endDate,
    // List<int>? weekdays,
  }) {
    return ReminderEntity(
      id: id ?? this.id,
      time: time ?? this.time,
      repeatType: repeatType ?? this.repeatType,
      // taskId: taskId ?? this.taskId,
      // note: note ?? this.note,
      // isActive: isActive ?? this.isActive,
      // endDate: endDate ?? this.endDate,
      // weekdays: weekdays ?? this.weekdays,
    );
  }

  @override
  List<Object?> get props => [id, time, repeatType];
}
