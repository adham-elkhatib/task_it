import 'dart:convert';

import '../../domain/entities/reminder_entity.dart';

class ReminderModel extends ReminderEntity {
  const ReminderModel({
    required super.id,
    required super.time,
    super.repeatType = ReminderRepeatType.none,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['id'],
      time: DateTime.parse(map['time']),
      repeatType: ReminderRepeatType.values[map['repeatType']],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time.toIso8601String(),
      'repeatType': repeatType.index,
    };
  }

  factory ReminderModel.fromJson(String source) =>
      ReminderModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory ReminderModel.fromEntity(ReminderEntity entity) {
    return ReminderModel(
      id: entity.id,
      time: entity.time,
      repeatType: entity.repeatType,
    );
  }

  ReminderEntity toEntity() {
    return ReminderEntity(id: id, time: time, repeatType: repeatType);
  }
}
