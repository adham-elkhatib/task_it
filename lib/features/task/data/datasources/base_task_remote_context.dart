import 'package:task_it/features/task/data/models/checklist_item_model.dart';
import 'package:task_it/features/task/data/models/reminder_model.dart';
import 'package:task_it/features/task/data/models/subtask_model.dart';
import 'package:task_it/features/task/data/models/task_attachment_model.dart';
import 'package:task_it/features/task/data/models/task_comment_model.dart';
import 'package:task_it/features/task/data/models/task_model.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../Data/Repositories/tasks_repo.dart';
import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';
import '../../../../data/Repositories/checklist_item_repo.dart';
import '../../../../data/Repositories/reminder_repo.dart';
import '../../../../data/Repositories/subtask_repo.dart';
import '../../../../data/Repositories/task_attachment_repo.dart';
import '../../../../data/Repositories/task_comment_repo.dart';

abstract class BaseTaskRemoteContext {
  final FirestoreRepo<TaskModel> taskRepo = TaskRepo();

  FirestoreRepo<CommentModel> getCommentRepo(String taskId) =>
      TaskCommentRepo(taskId: taskId);

  FirestoreRepo<AttachmentModel> getAttachmentRepo(String taskId) =>
      TaskAttachmentRepo(taskId: taskId);

  FirestoreRepo<ReminderModel> getReminderRepo(String taskId) =>
      ReminderRepo(taskId: taskId);

  FirestoreRepo<ChecklistItemModel> getChecklistRepo(String taskId) =>
      ChecklistItemRepo(taskId: taskId);

  FirestoreRepo<SubtaskModel> getSubtaskRepo(String taskId) =>
      SubtaskRepo(taskId: taskId);

  Future<T> executeRemoteCall<T>(
    Future<T> Function() request, {
    String? location,
  }) async {
    try {
      final response = await request();
      return response;
    } catch (e, s) {
      throw ErrorHandlingService.handle(e, s, location: location);
    }
  }
}
