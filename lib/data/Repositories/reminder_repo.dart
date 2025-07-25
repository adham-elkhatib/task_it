import 'package:task_it/features/task/data/models/reminder_model.dart';

import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class ReminderRepo extends FirestoreRepo<ReminderModel> {
  ReminderRepo({required this.taskId}) : super('tasks/$taskId/reminders');

  final String taskId;

  @override
  ReminderModel toModel(Map<String, dynamic> item) =>
      ReminderModel.fromMap(item);

  @override
  Map<String, dynamic> fromModel(ReminderModel item) => item.toMap();
}
