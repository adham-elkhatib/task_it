import 'package:flutter/material.dart';

enum TaskStatus { toDo, inProgress, done }

extension StatusExtension on TaskStatus {
  static final Map<TaskStatus, Map<String, dynamic>> _statusValues = {
    TaskStatus.toDo: {'color': const Color(0xff4F4F4F), 'label': 'To do'},
    TaskStatus.inProgress: {
      'color': const Color(0xff0070FF),
      'label': 'In progress',
    },
    TaskStatus.done: {'color': const Color(0xff317F45), 'label': 'Done'},
  };

  Map<String, dynamic> get values => _statusValues[this]!;

  Color get color => values['color'] as Color;

  String get label => values['label'] as String;

  String get name => toString().split('.').last;
}
