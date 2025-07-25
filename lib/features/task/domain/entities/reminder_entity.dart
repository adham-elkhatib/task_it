import 'package:equatable/equatable.dart';

enum ReminderRepeatType { none, daily, weekly, monthly }

class ReminderEntity extends Equatable {
  final String id;
  final DateTime time;
  final ReminderRepeatType repeatType;

  const ReminderEntity({
    required this.id,
    required this.time,
    this.repeatType = ReminderRepeatType.none,
  });

  ReminderEntity copyWith({
    String? id,
    DateTime? time,
    ReminderRepeatType? repeatType,
  }) {
    return ReminderEntity(
      id: id ?? this.id,
      time: time ?? this.time,
      repeatType: repeatType ?? this.repeatType,
    );
  }

  @override
  List<Object?> get props => [id, time, repeatType];
}
