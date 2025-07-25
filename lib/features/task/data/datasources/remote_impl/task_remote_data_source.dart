import 'package:task_it/features/task/data/datasources/remote_impl/remote_mixins.export.dart';
import 'package:task_it/features/task/data/models/subtask_model.dart';

import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../models/checklist_item_model.dart';
import '../../models/reminder_model.dart';
import '../../models/task_attachment_model.dart';
import '../../models/task_comment_model.dart';
import '../../models/task_model.dart';
import '../base_task_remote_context.dart';

abstract class TaskRemoteDataSource {
  // ===== TASKS ===== //
  // CRUD
  Future<TaskModel> getTask(String taskId);

  Future<List<TaskModel>> getTasksByProjectId(String projectId);

  Future<List<TaskModel>> getTasksByUserId(String userId);

  Future<TaskModel> createTask(TaskModel task);

  Future<TaskModel> updateTask(TaskModel task);

  Future<void> deleteTask(String taskId);

  Future<TaskModel> completeTask(TaskModel task);

  Future<TaskModel> unCompleteTask(TaskModel task);

  // Assignees
  Future<TaskModel> addTaskAssignee(TaskAssigneeParams params);

  Future<TaskModel> removeTaskAssignee(TaskAssigneeParams params);

  // Tags
  Future<TaskModel> addTaskTag(TaskTagParams params);

  Future<TaskModel> removeTaskTag(TaskTagParams params);

  // Comments
  Future<TaskModel> addTaskComment(CommentModel params);

  Future<TaskModel> updateTaskComment(CommentModel params);

  Future<TaskModel> deleteTaskComment(TaskCommentIdParams params);

  // Attachments
  Future<TaskModel> addTaskAttachment(AttachmentModel model);

  Future<TaskModel> updateTaskAttachment(AttachmentModel model);

  Future<void> deleteTaskAttachment(TaskAttachmentIdParams params);

  // Reminders
  Future<TaskModel> addTaskReminder(ReminderModel model);

  Future<TaskModel> removeTaskReminder(TaskReminderIdParams params);

  // Labels
  Future<TaskModel> addTaskLabel(TaskLabelParams params);

  Future<TaskModel> removeTaskLabel(TaskLabelParams params);

  // Checklist
  Future<TaskModel> addChecklist(ChecklistItemModel model);

  Future<TaskModel> updateChecklist(ChecklistItemModel model);

  Future<TaskModel> deleteChecklist(TaskChecklistItemIdParams params);

  // ===== SUBTASKS ===== //
  // CRUD
  Future<List<SubtaskModel>> getSubtasksByTaskId(String taskId);

  Future<SubtaskModel> addSubtask(SubtaskModel params);

  Future<SubtaskModel> updateSubtask(SubtaskModel params);

  Future<void> deleteSubtask(SubtaskIdParams params);

  // Assignees
  Future<SubtaskModel> addSubtaskAssignee(SubtaskAssigneeParams params);

  Future<SubtaskModel> removeSubtaskAssignee(SubtaskAssigneeParams params);

  // Tags
  Future<SubtaskModel> addSubtaskTag(SubtaskTagParams params);

  Future<SubtaskModel> removeSubtaskTag(SubtaskTagParams params);

  // Labels
  Future<SubtaskModel> addSubtaskLabel(SubtaskLabelParams params);

  Future<SubtaskModel> removeSubtaskLabel(SubtaskLabelParams params);

  // Comments
  Future<SubtaskModel> addSubtaskComment(CommentModel model);

  Future<SubtaskModel> updateSubtaskComment(CommentModel model);

  Future<SubtaskModel> deleteSubtaskComment(SubtaskCommentIdParams params);

  // Attachments
  Future<SubtaskModel> addSubtaskAttachment(AttachmentModel model);

  Future<SubtaskModel> updateSubtaskAttachment(AttachmentModel model);

  Future<SubtaskModel> deleteSubtaskAttachment(
    SubtaskAttachmentIdParams params,
  );

  // Reminders
  Future<SubtaskModel> addSubtaskReminder(ReminderModel model);

  Future<SubtaskModel> removeSubtaskReminder(SubtaskReminderParams params);

  // Checklist
  Future<SubtaskModel> addSubtaskChecklist(ChecklistItemModel model);

  Future<SubtaskModel> updateSubtaskChecklist(ChecklistItemModel model);

  Future<SubtaskModel> deleteSubtaskChecklist(SubtaskChecklistIdParams params);
}

class TaskRemoteDataSourceImpl extends BaseTaskRemoteContext
    with
        // ===== Tasks =====
        TaskCrudRemoteImpl,
        TaskAssigneesRemoteImpl,
        TaskAttachmentsRemoteImpl,
        TaskChecklistRemoteImpl,
        TaskCommentsRemoteImpl,
        TaskLabelsRemoteImpl,
        TaskRemindersRemoteImpl,
        TaskTagsRemoteImpl,
        // ===== Subtasks =====
        SubtaskCrudRemoteImpl,
        SubtaskAssigneesRemoteImpl,
        SubtaskAttachmentsRemoteImpl,
        SubtaskChecklistRemoteImpl,
        SubtaskCommentsRemoteImpl,
        SubtaskLabelsRemoteImpl,
        SubtaskRemindersRemoteImpl,
        SubtaskTagsRemoteImpl
    implements TaskRemoteDataSource {}
